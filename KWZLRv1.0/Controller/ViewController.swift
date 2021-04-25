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
    
    var quiz = QuizPool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        questionText.text = quiz.getCurrentQuestionText()
        progressBar.progress = 1.0 / Float(quiz.totalNoOfQues)
        
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        btnPressed = sender
        let answerSelected = sender.currentTitle!
        
        // Check whether user selected answer is correct or not
        let isAnswerCorrect = quiz.checkAnswer(answerSelected)
        
        // Give user feedback on the selected answer
        giveUserFeedback(isAnswerCorrect : isAnswerCorrect)
        
        // Setup the timer to update UI post feedback
        setTimerToUpdateUI()
    }
    
    func setTimerToUpdateUI() {
        // Invalidate timer if already running
        if (timer != nil) {
            timer?.invalidate()
            timer = nil
        }
        
        // Setup timer to update UI post feedback
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    func giveUserFeedback(isAnswerCorrect : Bool) {
        if isAnswerCorrect {
            btnPressed!.backgroundColor = UIColor.green
        } else {
            btnPressed!.backgroundColor = UIColor.red
        }
        btnPressed!.setTitleColor(UIColor.black, for: .normal)
    }
    
    
    @objc func updateUI() {
        // Increment Question No in Quiz Pool
        quiz.incrementQuestionNo()
        
        // Update UI with the Next Question
        questionText.text = quiz.getCurrentQuestionText()
        
        // Update Progress Bar
        progressBar.progress = Float(quiz.questionNo + 1) / Float (quiz.totalNoOfQues)
        
        // Revert Button back to original state
        btnPressed!.backgroundColor = btnBaseColor
        btnPressed!.setTitleColor(btnTextColor, for: .normal)
    }
    
}

