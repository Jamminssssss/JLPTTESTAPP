//
//  JLPTN1Video.swift
//  JLPT Quiz
//
//  Created by Jeamin on 12/2/23.
//

import SwiftUI
import AVKit
import Firebase
import FirebaseStorage


struct JLPTN1Video: View {
    @StateObject private var viewModel = PlayerViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var onFinish: () -> ()

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isVideoLoading {
                    ProgressView("로딩 중...") // 움직이는 로딩 인디케이터와 함께 "로딩 중..." 텍스트를 표시합니다
                } else if let player = viewModel.player {
                    VideoPlayer(player: player)
                } else {
                    Text("비디오 로딩 실패") // 실패 메시지로 대체할 수 있습니다
                }
            }
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(.red) // 이미지를 빨간색으로 변경합니다
                
            })
        }
    }
    
class PlayerViewModel: NSObject, ObservableObject {
    @Published var player: AVPlayer?
    @Published var isVideoLoading = true

    override init() {
        super.init()
        fetchData()
    }

    func fetchData() {
        let storage = Storage.storage()
        let storageRef = storage.reference(forURL: "gs://jlpt-quiz-2fb7d.appspot.com/JLPT N1 QUIZ.mp4")
        storageRef.downloadURL { [weak self] url, error in
            if let error = error {
                print("비디오 로딩 오류: \(error.localizedDescription)")
            } else if let url = url {
                DispatchQueue.main.async {
                    let player = AVPlayer(url: url)
                    player.addObserver(self!, forKeyPath: "status", options: [.new, .initial], context: nil)
                    self?.player = player
                }
            }
        }
    }

    deinit {
        player?.removeObserver(self, forKeyPath: "status")
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "status" {
            if player?.status == .readyToPlay {
                DispatchQueue.main.async {
                    self.isVideoLoading = false
                }
            } else if player?.status == .failed {
                print("비디오 로딩 실패: \(player?.error?.localizedDescription ?? "알 수 없는 오류")")
            }
        }
    }
  }
}
