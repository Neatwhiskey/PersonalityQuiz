//
//  Question.swift
//  PersonalityQuiz
//
//  Created by Jamaaldeen Opasina on 17/09/2021.
//

import Foundation

struct Question{
    var text: String
    var type: ResponseType
    var answers: [Answer]
}
enum ResponseType {
    case single, multiple, range
}
