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
                    
                    Image("Medal")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 220)
                    
                    Link(destination: URL(string: "https://youtu.be/QfXUeiEMQOI")!, label: {
                        Text("강의 영상")
                            .font(.system(size: 30))
                            .frame(width: 300, height: 60)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .padding()
                    })
                    
                    Link(destination: URL(string: "https://youtube.com/shorts/aBkXWvOzHfA")!, label: {
                            Text("개발 목적 및 과정")
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
            
            CustomButton(title: "다시 시작") {
                
                Firestore.firestore().collection("Quiz").document("Info").updateData([
                    "peopleAttended": FieldValue.increment(1.0)
                ])
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
