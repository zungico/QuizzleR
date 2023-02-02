//
//  ViewController.swift
//  QuizzleR
//
//  Created by Вова on 31.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!

    @IBOutlet weak var choice1Label: UIButton!
    @IBOutlet weak var choice2Label: UIButton!
    @IBOutlet weak var choice3Label: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
            
        if quizBrain.checkAnswer(userAnswer) {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    
    @objc func updateUI () {
        let answers = quizBrain.getAnswers()
        print (answers)
    
        choice1Label.setTitle(answers[0], for: .normal)
    
        choice2Label.setTitle(answers[1], for: .normal)
        choice3Label.setTitle(answers[2], for: .normal)
        
        textLabel.text = quizBrain.getQuestion()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        choice1Label.backgroundColor = .clear
        choice2Label.backgroundColor = .clear
        choice3Label.backgroundColor = .clear
       
        
    }
}
