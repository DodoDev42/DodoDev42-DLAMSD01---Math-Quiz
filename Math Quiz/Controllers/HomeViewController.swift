//
//  ViewController.swift
//  Math Quiz
//
//  Created by Ben on 13.06.24.
//

import UIKit

class HomeViewController: UIViewController {
    
    var diff = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showHighscores(_ sender: Any) {
        performSegue(withIdentifier: "showHighscores", sender: self)
    }
    
    @IBAction func startQuiz(_ sender: UIButton) {
        diff = Int(sender.accessibilityIdentifier!)!
        performSegue(withIdentifier: "goToQuiz", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToQuiz" {
    
            let destinationVC = segue.destination as! QuizViewController
            destinationVC.diff = diff
        }
    }
}

