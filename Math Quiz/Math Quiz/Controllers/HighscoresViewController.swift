//
//  HighscoresViewController.swift
//  Math Quiz
//
//  Created by Ben on 13.06.24.
//

import UIKit

class HighscoresViewController: UIViewController {

    @IBOutlet weak var easy: UILabel!
    @IBOutlet weak var medium: UILabel!
    @IBOutlet weak var hard: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        
        if let easy_score = defaults.object(forKey:"easy_score") as? String {
            if let easy_name = defaults.object(forKey:"easy_name") as? String {
                easy.text = easy_score + " by " + easy_name
            }
        }
        if let medium_score = defaults.object(forKey:"medium_score") as? String {
            if let medium_name = defaults.object(forKey:"medium_name") as? String {
                medium.text = medium_score + " by " + medium_name
            }
        }
        if let hard_score = defaults.object(forKey:"hard_score") as? String {
            if let hard_name = defaults.object(forKey:"hard_name") as? String {
                hard.text = hard_score + " by " + hard_name
            }
        }
    }
    
    @IBAction func hideHighscores(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
