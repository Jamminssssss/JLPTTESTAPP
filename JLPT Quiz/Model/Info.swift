//
//  Info.swift
//  JLPT Quiz
//
//  Created by Jeamin on 10/8/23.
//

import SwiftUI

struct Info: Codable{
    var title: String
    var peopleAttended: Int
    var rules: [String]

    enum CodinKey: CodingKey {
        case title
        case peopleAttended
        case rules
    }
}
