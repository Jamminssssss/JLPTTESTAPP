//
//  ProblemSolving.swift
//  JLPT Quiz
//
//  Created by Jeamin on 10/26/23.
//

import SwiftUI
import SafariServices

struct ProblemSolving: View {
    @State private var showJLPTN1: Bool = false
    @State private var showJLPTN2: Bool = false
    @State private var showJLPTN3: Bool = false
    @State private var showJLPTN4: Bool = false

    var body: some View {
        VStack {
            // JLPTN1 Button
            Button(action: {
                showJLPTN1.toggle()
            }) {
                Text("JLPT N1 강의")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
            }
            .fullScreenCover(isPresented: $showJLPTN1) {
                SafariView(url: URL(string: "https://www.youtube.com/watch?v=zB8nDo2ZKMw")!, onDismiss: {
                    showJLPTN1 = false
                })
            }

            // JLPTN2 Button
            Button(action: {
                showJLPTN2.toggle()
            }) {
                Text("JLPT N2 강의")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
            }
            .fullScreenCover(isPresented: $showJLPTN2) {
                SafariView(url: URL(string: "https://www.youtube.com/watch?v=vg-OkwsC1Tk")!, onDismiss: {
                    showJLPTN2 = false
                })
            }

            // JLPTN3 Button
            Button(action: {
                showJLPTN3.toggle()
            }) {
                Text("JLPT N3 강의")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(Color.orange)
                    .foregroundColor(.white)
            }
            .fullScreenCover(isPresented: $showJLPTN3) {
                SafariView(url: URL(string: "https://www.youtube.com/watch?v=BlUFq-qHckc")!, onDismiss: {
                    showJLPTN3 = false
                })
            }

            // JLPTN4 Button
            Button(action: {
                showJLPTN4.toggle()
            }) {
                Text("JLPT N4 강의")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(Color.purple)
                    .foregroundColor(.white)
            }
            .fullScreenCover(isPresented: $showJLPTN4) {
                SafariView(url: URL(string: "https://www.youtube.com/watch?v=QfXUeiEMQOI")!, onDismiss: {
                    showJLPTN4 = false
                })
            }
        }
        .padding()
    }
}

struct SafariView : UIViewControllerRepresentable {

    let url : URL
    let onDismiss : () -> Void

    func makeUIViewController(context : Context) -> some UIViewController {

        let safariViewController = SFSafariViewController(url : self.url)
        safariViewController.delegate = context.coordinator

        return safariViewController
    }

    func updateUIViewController(_ uiViewController : UIViewControllerType, context : Context) {

    }

    func makeCoordinator() -> Coordinator {

        Coordinator(self)
    }

    class Coordinator : NSObject, SFSafariViewControllerDelegate {

        let parent : SafariView

        init(_ parent : SafariView) {

            self.parent = parent
        }

        func safariViewControllerDidFinish(_ controller : SFSafariViewController) {

            parent.onDismiss()
        }
    }
}


    
#Preview {
    ProblemSolving()
}
