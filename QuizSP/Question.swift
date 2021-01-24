//
//  Question.swift
//  QuizSP
//
//  Created by Алексей Красиков on 19.08.2020.
//  Copyright © 2020 Алексей Красиков. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [String]
}

enum ResponseType {
    case single, complete
}


