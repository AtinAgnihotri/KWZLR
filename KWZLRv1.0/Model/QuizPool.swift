//
//  QuestionPool.swift
//  KWZLRv1.0
//
//  Created by Atin Agnihotri on 25/04/21.
//

import Foundation

struct QuizPool {
    
    // Quiz Array
    let questionPool = [
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
    var score : Int = 0
    
    init() {
        totalNoOfQues = questionPool.count
    }
    
    mutating func checkAnswer (_ answerSelected : String) -> Bool {
        let preString = "The Answer to Question No. \(questionNo + 1)"
        if answerSelected == questionPool[questionNo].a {
            print(preString + " is correct")
            score += 1
            return true
        }
        print(preString + " is incorrect")
        return false
    }
    
    func getCurrentQuestionText () -> String {
        return questionPool[questionNo].q
    }
    
    func getProgression () -> Float {
        return Float(questionNo + 1)/Float(totalNoOfQues)
    }
    
    mutating func incrementQuestionNo () {
        if questionNo < (totalNoOfQues - 1) {
            questionNo += 1
        } else {
            questionNo = 0
            score = 0
        }
    }
    
    func getScore() -> Int {
        return score
    }
}
