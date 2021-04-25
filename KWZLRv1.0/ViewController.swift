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
    
    var btnPressed : UIButton? = nil
    var btnTextColor: UIColor = UIColor.white
    var btnBaseColor: UIColor = UIColor.systemIndigo
    var timer : Timer? = nil
    
    
    // Quiz Array
    let quiz = [
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    var totalNoOfQues : Int = 0
    var questionNo : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionText.text = quiz[questionNo].q
        totalNoOfQues = quiz.count
        progressBar.progress = 0.0
        
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        let answerSelected = sender.currentTitle!
        let correctAnswer = quiz[questionNo].a
        
        btnPressed = sender
//        btnBaseColor = sender.backgroundColor!
//        btnTextColor = sender.currentTitleColor
        
        checkAnswer(answerSelected, correctAnswer)
        if (timer != nil) {
            timer?.invalidate()
            timer = nil
        }
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateQuestionText), userInfo: nil, repeats: false)
//        updateQuestionText(sender)
    }
    
    func checkAnswer (_ answerSelected : String, _ correctAnswer : String) {
        let preString = "The Answer to Question No. \(questionNo + 1)"
        if answerSelected == correctAnswer {
            btnPressed!.backgroundColor = UIColor.green
            print(preString + " is correct")
        } else {
            btnPressed!.backgroundColor = UIColor.red
            print(preString + " is incorrect")
        }
        btnPressed!.setTitleColor(UIColor.black, for: .normal)
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
    
    @objc func updateQuestionText() {
        incrementQuestion()
        questionText.text = quiz[questionNo].q
        btnPressed!.backgroundColor = btnBaseColor
        btnPressed!.setTitleColor(btnTextColor, for: .normal)
    }
    
}

