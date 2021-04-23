//
//  ViewController.swift
//  KWZLRv1.0
//
//  Created by Atin Agnihotri on 23/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var questionText: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var falseButton: UIButton!
    
    let quiz = [
        ["Four + Two Equals Six?", "True"],
        ["Five - Three is greater than One?", "True"],
        ["Eight + Seven is double of Nine?", "False"]
    ]
    
    var questionNo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionText.text = quiz[questionNo][0]
        
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        let answerSelected = sender.currentTitle!
        let correctAnswer = quiz[questionNo][1]
        checkAnswer(answerSelected, correctAnswer)
        incrementQuestion()
    }
    
    func checkAnswer (_ answerSelected : String, _ correctAnswer : String) {
        let preString = "The Answer to Question No. \(questionNo + 1)"
        if answerSelected == correctAnswer {
            print(preString + " is correct")
        } else {
            print(preString + " is incorrect")
        }
    }
    
    func incrementQuestion() {
        if questionNo < 2 {
            questionNo += 1
        }
        questionText.text = quiz[questionNo][0]
    }
    
}

