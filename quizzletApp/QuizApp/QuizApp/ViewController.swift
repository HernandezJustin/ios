//
//  ViewController.swift
//  QuizApp
//
//  Created by ACLTC on 8/22/17.
//  Copyright © 2017 Justin Hernandez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var index : Int = 1
    
    @IBOutlet weak var questionText: UILabel!
    let questions = QuestionBank()
    var pickedAnswer : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        questionText.text = questions.questionArray[0].questionText
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkQuestion(){
    
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == 1{
//            questionText.text = questions.questionArray[index].questionText
//            index += 1
            pickedAnswer = true
        }
        else {
            pickedAnswer = false
        }
        
        checkAnswer()
    }
    
    func checkAnswer(){
        
    }
    
    updateUI

}

