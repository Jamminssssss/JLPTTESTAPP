//
//  Question.swift
//  JLPT Quiz
//
//  Created by Jeamin on 10/8/23.
//

import SwiftUI
import AVKit

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



