//
//  ScoreCardView.swift
//  JLPT Quiz
//
//  Created by Jeamin on 10/8/23.
//

import SwiftUI
import FirebaseFirestore

struct ScoreCardView: View {
    var score: CGFloat
    var onDismiss: ()->()
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            Spacer() // Add this line
            VStack(spacing: 15) {
                Text("당신의\n 정답률은?")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)

                Text(String(format: "%.0f", score) + "%")
                    .font(.title.bold())
                    .padding(.bottom,10)
            }
            
            Spacer() // Add this line
            CustomButton(title: "다시 시작") {
                Firestore.firestore().collection("Quiz").document("Info").updateData([
                    "peopleAttended": FieldValue.increment(1.0)
                ])
                onDismiss()
                dismiss()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(15)
    }
}

