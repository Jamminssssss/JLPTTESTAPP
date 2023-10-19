//
//  Info.swift
//  JLPT Quiz
//
//  Created by Jeamin on 10/8/23.
//

import SwiftUI

struct Info: Codable{
    var title: String
    var rules: [String]

    enum CodinKey: CodingKey {
        case title
        case rules
    }
}
