//
//  SelectVideo.swift
//  JLPT Quiz
//
//  Created by Jeamin on 12/1/23.
//

import SwiftUI

struct SelectVideo: View {
    @State private var showJLPTN1Video: Bool = false
    @State private var showJLPTN2Video: Bool = false
    @State private var showJLPTN3Video: Bool = false
    @State private var showJLPTN4Video: Bool = false

    var body: some View {
        VStack {
            Button(action: {
                showJLPTN1Video.toggle()
            }) {
                Text("N1 lecture")
                    .font(.title)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.black)
            }
            .fullScreenCover(isPresented: $showJLPTN1Video) {
                JLPTN1Video(onFinish: {
                    showJLPTN1Video = false
                })
            }
            Button(action: {
                showJLPTN2Video.toggle()
            }) {
                Text("N2 lecture")
                    .font(.title)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(Color.green)
                    .foregroundColor(.black)
            }
            .fullScreenCover(isPresented: $showJLPTN2Video) {
                JLPTN2Video(onFinish: {
                    showJLPTN2Video = false
                })
            }
            Button(action: {
                showJLPTN3Video.toggle()
            }) {
                Text("N3 lecture")
                    .font(.title)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(Color.orange)
                    .foregroundColor(.black)
            }
            .fullScreenCover(isPresented: $showJLPTN3Video) {
                JLPTN3Video(onFinish: {
                    showJLPTN3Video = false
                })
            }
            Button(action: {
                showJLPTN4Video.toggle()
            }) {
                Text("N4 lecture")
                    .font(.title)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(Color.purple)
                    .foregroundColor(.black)
            }
            .fullScreenCover(isPresented: $showJLPTN4Video) {
                JLPTN4Video(onFinish: {
                    showJLPTN4Video = false
                })
            }
        }
        .padding()
    }
}

