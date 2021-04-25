//
//  ViewController.swift
//  KWZLRv1.0
//
//  Created by Atin Agnihotri on 23/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    // UI IB Outlets
    @IBOutlet var questionText: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var falseButton: UIButton!
    
    // Quiz Array
    let quiz = [
        ["Four + Two Equals Six?", "True"],
        ["Five - Three is greater than One?", "True"],
        ["Eight + Seven is double of Nine?", "False"]
    ]
    
    var totalNoOfQues : Int = 0
    var questionNo : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionText.text = quiz[questionNo][0]
        totalNoOfQues = quiz.count
        progressBar.progress = 0.0
        
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        let answerSelected = sender.currentTitle!
        let correctAnswer = quiz[questionNo][1]
        checkAnswer(answerSelected, correctAnswer)
        updateQuestionText()
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
        if questionNo < (totalNoOfQues - 1) {
            questionNo += 1
            progressBar.progress = Float(questionNo) / Float(totalNoOfQues)
            
        } else  {
            questionNo = 0
            progressBar.progress = 0
        }
    }
    
    func updateQuestionText() {
        incrementQuestion()
        questionText.text = quiz[questionNo][0]
    }
    
}

