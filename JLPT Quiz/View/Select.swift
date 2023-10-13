//
//  Select.swift
//  JLPT Quiz
//
//  Created by Jeamin on 10/9/23.
//

import SwiftUI

struct Select: View {
    @State private var showJLPTN1: Bool = false
    @State private var showJLPTN2: Bool = false
    @State private var showJLPTN3: Bool = false
    @State private var showJLPTN4: Bool = false
    @State private var showJLPTN5: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                // JLPTN1 Button
                Button(action: {
                    showJLPTN1.toggle()
                }) {
                    Text("JLPTN1")
                        .frame(width: 100, height: 100)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .fullScreenCover(isPresented: $showJLPTN1) {
                    JLPTN1(onFinish: {
                        showJLPTN1 = false
                    })
                }
                
                // JLPTN2 Button
                Button(action: {
                    showJLPTN2.toggle()
                }) {
                    Text("JLPTN2")
                        .frame(width: 100, height: 100)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .fullScreenCover(isPresented: $showJLPTN2) {
                    JLPTN2(onFinish: {
                        showJLPTN2 = false
                    })
                }
            }
            
            HStack {
                // JLPTN3 Button
                Button(action: {
                    showJLPTN3.toggle()
                }) {
                    Text("JLPTN3")
                        .frame(width: 100, height: 100)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .fullScreenCover(isPresented: $showJLPTN3) {
                    JLPTN3(onFinish: {
                        showJLPTN3 = false
                    })
                }
                
                // JLPTN4 Button
                Button(action: {
                    showJLPTN4.toggle()
                }) {
                    Text("JLPTN4")
                        .frame(width: 100, height: 100)
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .fullScreenCover(isPresented: $showJLPTN4) {
                    JLPTN4(onFinish: {
                        showJLPTN4 = false
                    })
                }
                
                // JLPTN5 Button
                Button(action: {
                    showJLPTN5.toggle()
                }) {
                    Text("JLPTN5")
                        .frame(width: 100, height: 100)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .fullScreenCover(isPresented: $showJLPTN5) {
                    JLPTN5(onFinish: {
                        showJLPTN5 = false
                    })
                }
            }
        }
    }
}
