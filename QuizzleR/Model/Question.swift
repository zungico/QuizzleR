//
//  Question.swift
//  QuizzleR
//
//  Created by Вова on 02.02.2023.
//

import UIKit

struct Question {
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    init (q: String, a: [String], correctAnswer: String) {
        text = q
        answer = a
        self.correctAnswer = correctAnswer
    }
}
