//
//  ViewController.swift
//  Math Quiz
//
//  Created by Ben on 13.06.24.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var question: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var score: UILabel!
    
    @IBAction func endQuiz(_ sender: Any) {
        performSegue(withIdentifier: "goToScore", sender: self)
    }

    var quizBrain = QuizBrain()
    var diff : Int?
    
    @objc func updateUI() {
        question.setTitle(quizBrain.getQuestionText(), for: .normal)

        progressBar.progress = quizBrain.getProgress()
        let Answers = quizBrain.getAnswerTexts()
        answer1.setTitle(Answers[0], for: .normal)
        answer2.setTitle(Answers[1], for: .normal)
        answer3.setTitle(Answers[2], for: .normal)
        answer1.tintColor = UIColor.sec
        answer2.tintColor = UIColor.sec
        answer3.tintColor = UIColor.sec
        score.text = "Score: \(quizBrain.getScore())"
        
    }
    
    override func viewDidLoad() {
        quizBrain = QuizBrain(difficulty: diff!)
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        sender.tintColor  = quizBrain.checkAnswer(sender.currentTitle!) ? UIColor.green : UIColor.red
        if quizBrain.getIsFinished() {
            performSegue(withIdentifier: "goToScore", sender: self)
        } else {
            quizBrain.nextQuestion()
        }
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToScore" {
    
            let destinationVC = segue.destination as! ScoreViewController
            destinationVC.diff = diff
            destinationVC.score = quizBrain.getScore()
        }
    }
}

