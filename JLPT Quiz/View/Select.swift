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
            // JLPTN1 Button
            Button(action: {
                showJLPTN1.toggle()
            }) {
                Text("N1 文字、語彙、文法、読解")
                    .font(.title)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.black)
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
                Text("N2 文字、語彙、文法、読解")
                    .font(.title)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(Color.green)
                    .foregroundColor(.black)
            }
            .fullScreenCover(isPresented: $showJLPTN2) {
                JLPTN2(onFinish: {
                    showJLPTN2 = false
                })
            }
            
            // JLPTN3 Button
            Button(action: {
                showJLPTN3.toggle()
            }) {
                Text("N3 文字、語彙、文法、読解")
                    .font(.title)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(Color.orange)
                    .foregroundColor(.black)
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
                Text("N4 文字、語彙、文法、読解")
                    .font(.title)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(Color.purple)
                    .foregroundColor(.black)
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
                Text("N5 文字、語彙、文法、読解")
                    .font(.title)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(Color.mint)
                    .foregroundColor(.black)
            }
            .fullScreenCover(isPresented: $showJLPTN5) {
                JLPTN5(onFinish: {
                    showJLPTN5 = false
                })
            }
            
        }
        .padding()
    }
}
