//
//  Home.swift
//  JLPT Quiz
//
//  Created by Jeamin on 10/8/23.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

import SwiftUI

struct Home: View {
    @State private var quizInfo: Info?
    @State private var questions: [Question] = []
    @State private var startQuiz: Bool = false
    @AppStorage("log_status") private var logStatus: Bool = false

    var body: some View {
        if let info = quizInfo{
            VStack(spacing: 10){
                Text(info.title)
                    .font(.title)
                    .fontWeight(.semibold)
                    .hAlign(.leading)
                
                if !info.rules.isEmpty{
                    RulesView(info.rules)
                }
                
                CustomButton(title: "시작", onClick: {
                    startQuiz.toggle()
                })
                .vAlign(.bottom)
            }
            .padding(15)
            .vAlign(.top)
            .fullScreenCover(isPresented: $startQuiz) {
                Select()
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
    func RulesView(_ rules: [String])->some View{
        VStack(alignment: .leading, spacing: 15) {
            Text("시작전에 읽어주세요.")
                .font(.title3)
                .fontWeight(.bold)
                .padding(.bottom,12)
            
            ForEach(rules,id: \.self){rule in
                HStack(alignment: .top, spacing: 10) {
                    Circle()
                        .fill(.black)
                        .frame(width: 8, height: 8)
                        .offset(y: 6)
                    Text(rule)
                        .font(.callout)
                        .lineLimit(3)
                }
            }
        }
    }

    @ViewBuilder
        func CustomLabel(_ image: String,_ title: String,_ subTitle: String)->some View{
            HStack(spacing: 12){
                Image(systemName: image)
                    .font(.title3)
                    .frame(width: 45, height: 45)
                    .background{
                        Circle()
                            .fill(.gray.opacity(0.1))
                            .padding(-1)
                            .background{
                                Circle()
                                    .stroke(Color("BG"),lineWidth: 1)
                            }
                    }
                VStack(alignment: .leading, spacing: 4){
                    Text(title)
                        .fontWeight(.bold)
                        .foregroundColor(Color("BG"))
                    Text(subTitle)
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                }
                .hAlign(.leading)
            }
        }
        
    
    func fetchData()async throws{
        try await loginUserAnonymous()
        let info = try await Firestore.firestore().collection("Quiz").document("Info").getDocument().data(as: Info.self)

        await MainActor.run(body: {
            self.quizInfo = info
        })
    }

    func loginUserAnonymous()async throws{
        if !logStatus{
            try await Auth.auth().signInAnonymously()
        }
    }
}


#Preview {
    Home()
}

extension View{
    func hAlign(_ alignment: Alignment)->some View{
        self
            .frame(maxWidth: .infinity,alignment: alignment)
    }
    
    func vAlign(_ alignment: Alignment)->some View{
        self
            .frame(maxHeight: .infinity,alignment: alignment)
    }
}
