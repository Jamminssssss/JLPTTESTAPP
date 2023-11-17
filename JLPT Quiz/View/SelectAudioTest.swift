//
//  SelectAudioTest.swift
//  JLPT Quiz
//
//  Created by Jeamin on 11/14/23.
//

import SwiftUI

struct SelectAudioTest: View {
    @State private var showJLPTN1AUDIOTEST: Bool = false
    
    var body: some View {
        VStack {
            // JLPTN1 Button
            Button("JLPTN1") {
                showJLPTN1AUDIOTEST.toggle()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .fullScreenCover(isPresented: $showJLPTN1AUDIOTEST) {
                JLPTN1AUDIOTEST {
                    showJLPTN1AUDIOTEST = false
                }
            }
        }
        .padding()
    }
}

struct SelectAudioTest_Previews: PreviewProvider {
    static var previews: some View {
        SelectAudioTest()
    }
}
