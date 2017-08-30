//
//  QuestionBank.swift
//  QuizApp
//
//  Created by ACLTC on 8/24/17.
//  Copyright © 2017 Justin Hernandez. All rights reserved.
//

import Foundation

class QuestionBank {
    var questionArray = [Question]()
    
    init() {
        questionArray.append(Question("If an application is created without any constraints, it will display nicely on all iphone devices", false))
        questionArray.append(Question("A boolean has only two values, true and false", true))
        questionArray.append(Question("Swift has the ability to infer data types based on assigned values", true))
        questionArray.append(Question("iOS apps are only developed in Swift", false))
        questionArray.append(Question("UILabels can act as outlets and actions", false))
        questionArray.append(Question("Functions in Swift are declared with the keyword, func", true))
        questionArray.append(Question("The information displayed in info.plist is formatted as a dictionary", true))
        questionArray.append(Question("Swift writes XML to define UI elements that are added to the storyboard", true))
        questionArray.append(Question("The method println, is used to display text to the console in Swift", false))
        questionArray.append(Question("Tags in Swift provide unique identifiers to UI elements in your app", true))
        
    }
    
}
