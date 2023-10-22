//
//  ScoreCardView.swift
//  JLPT Quiz
//
//  Created by Jeamin on 10/8/23.
//

import SwiftUI
import FirebaseFirestore


struct ScoreCardView: View{
    var score: CGFloat
    var onDismiss: ()->()
    @Environment(\.dismiss) private var dismiss
    var body: some View{
        VStack{
            ScrollView {
                VStack(spacing: 15){
                    Text("시험이 끝났습니다.")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    VStack(spacing: 15){
                        Text("당신의\n 정답률은?")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                        
                        Text(String(format: "%.0f", score) + "%")
                            .font(.title.bold())
                            .padding(.bottom,10)
                        
                        
                        Link(destination: URL(string: "https://www.youtube.com/watch?v=zB8nDo2ZKMw")!, label: {
                            Text("JLPT N1 강의")
                                .font(.system(size: 30))
                                .frame(width: 300, height: 60)
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .padding()
                        })
                        
                        Link(destination: URL(string: "https://www.youtube.com/watch?v=vg-OkwsC1Tk")!, label: {
                            Text("JLPT N2 강의")
                                .font(.system(size: 30))
                                .frame(width: 300, height: 60)
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .padding()
                        })
                        
                        Link(destination: URL(string: "https://www.youtube.com/watch?v=BlUFq-qHckc")!, label: {
                            Text("JLPT N3 강의")
                                .font(.system(size: 30))
                                .frame(width: 300, height: 60)
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .padding()
                        })
                        
                        Link(destination: URL(string: "https://www.youtube.com/watch?v=QfXUeiEMQOI")!, label: {
                            Text("JLPT N4 강의")
                                .font(.system(size: 30))
                                .frame(width: 300, height: 60)
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .padding()
                        })
                    }
                    .foregroundColor(.black)
                    .padding(.horizontal,15)
                    .padding(.vertical,20)
                    .hAlign(.center)
                    .background {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(.white)
                    }
                }
                .vAlign(.center)
            }
            
            Spacer()
            CustomButton(title: "다시 시작") {
                
                Firestore.firestore().collection("Quiz").document("Info")
                onDismiss()
                dismiss()
            }
        }
        .padding(15)
        .background {
            Color("BG")
                .ignoresSafeArea()
        }
    }
}
