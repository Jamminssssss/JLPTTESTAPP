//
//  Question.swift
//  JLPT Quiz
//
//  Created by Jeamin on 10/8/23.
//

import SwiftUI
import Foundation

struct Question: Identifiable, Codable{
    var id: UUID = .init()
    var question: String
    var options: [String]
    var answer: String
    
    var tappedAnswer: String =  ""
    
    enum CodingKeys: CodingKey {
        case question
        case options
        case answer
    }
}


struct AudioQuestion {
    var options: [String]
    var answer: String
    var audioFile: String
    var startTime: TimeInterval
    var endTime: Double
    var images: [String]? // 이미지 속성을 배열로 변경하고 선택적으로 만듭니다.

    init(options: [String], answer: String, audioFile: String, startTime: TimeInterval = 0, endTime: Double, images: [String]? = nil) {
        self.options = options
        self.answer = answer
        self.audioFile = audioFile
        self.startTime = startTime
        self.endTime = endTime
        self.images = images
    }
}
