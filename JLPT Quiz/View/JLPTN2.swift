//
//  JLPTN2.swift
//  JLPT Quiz
//
//  Created by Jeamin on 10/8/23.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct JLPTN2: View {
    @State private var quizInfo: Info?
    @State private var questions: [Question] = []
    @State private var startQuiz: Bool = false
    @AppStorage("log_status") private var logStatus: Bool = false
    var onFinish: ()->()
    @Environment(\.dismiss) private var dismiss
    @State private var currentIndex: Int = 0
    @State private var score: CGFloat = 0
    @State private var showScoreCard: Bool = false

    var body: some View {
        if let info = quizInfo{
            VStack(spacing: 10){
                Button {
                                dismiss()
                            } label: {
                                Image(systemName: "xmark")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.red)
                            }
                            .hAlign(.leading)
                Text("JLPT N2")
                    .font(.title)
                    .fontWeight(.semibold)
                    .hAlign(.leading)
                
                GeometryReader{
                    let _ = $0.size
                    
                    ForEach(questions.indices,id: \.self) { index in
                        if currentIndex == index{
                            QuestionView(question: questions[currentIndex])
                                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                        }
                    }
                }
                .padding(.horizontal,-15)
                .padding(.vertical,15)
                
                CustomButton(title: currentIndex == (questions.count - 1) ? "끝" : "다음 문제") {
                    if currentIndex == (questions.count - 1){
                        showScoreCard.toggle()
                    }else{
                        withAnimation(.easeInOut){
                            currentIndex += 1
                        }
                    }
                }
            }
            .padding(15)
            .hAlign(.center).vAlign(.top)
            .background {
                Color("BG")
                    .ignoresSafeArea()
            }
            .environment(\.colorScheme, .dark)
            .fullScreenCover(isPresented: $showScoreCard) {
                ScoreCardView(score: score / CGFloat(questions.count) * 100) {
                    dismiss()
                    onFinish()
                }
            }
        }else{
            VStack(spacing: 4){
                ProgressView()
                Text("잠시만 기다려 주세요")
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            .task {
                do{
                    try await fetchData()
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }

    @ViewBuilder
    func QuestionView(question: Question)->some View{
        VStack(alignment: .leading, spacing: 15) {
            Text("Question \(currentIndex + 1)/\(questions.count)")
                .font(.callout)
                .foregroundColor(.gray)
                .hAlign(.leading)

            Text(question.question)
                .font(.system(size: 17))
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.black)

            VStack(spacing: 12){
                ForEach(question.options,id: \.self){option in
                    ZStack{
                        OptionView(option, question.answer == option && question.tappedAnswer != "" ? Color.green : Color.black)

                        if question.tappedAnswer == option && question.tappedAnswer != question.answer {
                            OptionView(option, Color.red)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        guard questions[currentIndex].tappedAnswer == "" else{return}
                        withAnimation(.easeInOut){
                            questions[currentIndex].tappedAnswer = option

                            if question.answer == option{
                                score += 1.0
                            }
                        }
                    }
                }
            }
            .padding(.vertical,10)
        }
        .padding(15)
        .hAlign(.center)
        .background {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.white.opacity(0.6))
        }
        .padding(.horizontal,15)
    }

    @ViewBuilder
       func OptionView(_ option: String,_ tint: Color)->some View{
           Text(option)
               .fixedSize(horizontal: false, vertical: true)
               .font(.system(size: 15))
               .foregroundColor(tint)
               .padding(.horizontal,5)
               .padding(.vertical,10)
               .hAlign(.center)
               .background {
                   RoundedRectangle(cornerRadius: 12, style: .continuous)
                       .fill(tint.opacity(0.15))
                       .background {
                           RoundedRectangle(cornerRadius: 12, style: .continuous)
                               .stroke(tint.opacity(tint == .gray ? 0.15 : 1),lineWidth: 2)
                       }
           }
       }

    func fetchData()async throws{
        try await loginUserAnonymous()
        let info = try await Firestore.firestore().collection("Quiz").document("Info").getDocument().data(as: Info.self)
        let questions = try await Firestore.firestore().collection("Quiz").document("Info").collection("Questions1").getDocuments().documents.compactMap{
            try $0.data(as: Question.self)
        }

        await MainActor.run(body: {
            self.quizInfo = info
            self.questions = questions
        })
    }

    func loginUserAnonymous()async throws{
        if !logStatus{
            try await Auth.auth().signInAnonymously()
        }
    }
}

#Preview {
    ContentView()
}
