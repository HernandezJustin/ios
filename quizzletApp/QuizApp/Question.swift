//
//  Question.swift
//  QuizApp
//
//  Created by ACLTC on 8/22/17.
//  Copyright © 2017 Justin Hernandez. All rights reserved.
//

import Foundation

class Question {
    let questionText: String
    let correctAnswer: Bool
    
    init(_ question: String, _ answer: Bool) {
        questionText = question
        correctAnswer = answer
    }
}
