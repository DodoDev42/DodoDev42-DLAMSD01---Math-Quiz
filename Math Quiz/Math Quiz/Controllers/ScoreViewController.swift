import UIKit

class ScoreViewController: UIViewController {

    var diff: Int?
    var score: String?
    var playerName: String?

    @IBOutlet weak var Score: UILabel!
    @IBOutlet weak var niceWords: UILabel!
    @IBOutlet weak var nameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let scoreText = score, let scoreValue = Int(scoreText) else { return }
        
        Score.text = "Your Score is \(scoreText) of 10"
        niceWords.text = feedback(for: scoreValue)
    }

    @IBAction func saveScore(_ sender: Any) {
        guard let playerName = nameTextField.text, !playerName.isEmpty else { return }
        self.playerName = playerName
        guard let scoreText = score else { return }
        
        updateHighScore(for: diff, with: scoreText, playerName: playerName)
    }

    private func feedback(for score: Int) -> String {
        switch score {
        case 10:
            return "Wow, very good, everything right"
        case 9, 8:
            return "Not bad"
        case 7, 6:
            return "Well done"
        case 5, 4:
            return "Maybe next time"
        default:
            return "At least you tried"
        }
    }

    private func updateHighScore(for difficulty: Int?, with score: String, playerName: String) {
        guard let difficulty = difficulty, let scoreInt = Int(score) else { return }

        let defaults = UserDefaults.standard
        let (scoreKey, nameKey): (String, String)

        switch difficulty {
        case 0:
            (scoreKey, nameKey) = ("easy_score", "easy_name")
        case 1:
            (scoreKey, nameKey) = ("medium_score", "medium_name")
        case 2:
            (scoreKey, nameKey) = ("hard_score", "hard_name")
        default:
            return
        }

        if let savedScore = defaults.string(forKey: scoreKey), let savedScoreInt = Int(savedScore), savedScoreInt >= scoreInt {
            return
        } else {
            defaults.set(score, forKey: scoreKey)
            defaults.set(playerName, forKey: nameKey)
        }
    }

    @IBAction func newQuiz(_ sender: Any) {
        performSegue(withIdentifier: "goToHome", sender: self)
    }
}
