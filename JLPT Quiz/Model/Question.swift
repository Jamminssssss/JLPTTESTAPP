//
//  Question.swift
//  JLPT Quiz
//
//  Created by Jeamin on 10/8/23.
//

import SwiftUI
import Foundation
import FirebaseStorage

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

    init(options: [String], answer: String, audioFile: String, startTime: TimeInterval = 0, endTime: Double) {
        self.options = options
        self.answer = answer
        self.audioFile = audioFile
        self.startTime = startTime
        self.endTime = endTime
    }
}
