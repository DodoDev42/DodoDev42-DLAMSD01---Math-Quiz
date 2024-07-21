//  Created by Ben on 12.03.24.


import Foundation

struct QuizBrain {
    
    let quiz =
    [
        [
            Question(q: "5 + 7 = ?", a: ["10", "12", "15"], c: "12"),
            Question(q: "9 - 4 = ?", a: ["3", "5", "6"], c: "5"),
            Question(q: "3 × 4 = ?", a: ["9", "12", "14"], c: "12"),
            Question(q: "16 ÷ 4 = ?", a: ["3", "4", "5"], c: "4"),
            Question(q: "6 + 8 = ?", a: ["13", "14", "16"], c: "14"),
            Question(q: "20 - 9 = ?", a: ["10", "11", "12"], c: "11"),
            Question(q: "7 × 2 = ?", a: ["12", "14", "16"], c: "14"),
            Question(q: "18 ÷ 3 = ?", a: ["5", "6", "7"], c: "6"),
            Question(q: "4 + 9 = ?", a: ["12", "13", "14"], c: "13"),
            Question(q: "11 - 5 = ?", a: ["4", "6", "7"], c: "6")
        ],
        [
            Question(q: "15 ÷ 3 = ?", a: ["4", "5", "6"], c: "5"),
            Question(q: "12 + 8 = ?", a: ["18", "20", "22"], c: "20"),
            Question(q: "25 - 7 = ?", a: ["16", "18", "19"], c: "18"),
            Question(q: "9 × 3 = ?", a: ["24", "27", "30"], c: "27"),
            Question(q: "30 ÷ 5 = ?", a: ["5", "6", "7"], c: "6"),
            Question(q: "14 + 17 = ?", a: ["30", "31", "32"], c: "31"),
            Question(q: "40 - 12 = ?", a: ["27", "28", "29"], c: "28"),
            Question(q: "8 × 4 = ?", a: ["30", "32", "34"], c: "32"),
            Question(q: "36 ÷ 6 = ?", a: ["5", "6", "7"], c: "6"),
            Question(q: "21 + 9 = ?", a: ["29", "30", "31"], c: "30")
        ],
        [
            Question(q: "8 × 7 = ?", a: ["54", "56", "58"], c: "56"),
            Question(q: "144 ÷ 12 = ?", a: ["10", "12", "14"], c: "12"),
            Question(q: "√49 = ?", a: ["6", "7", "8"], c: "7"),
            Question(q: "3^3 = ?", a: ["18", "24", "27"], c: "27"),
            Question(q: "5 × 9 = ?", a: ["40", "45", "50"], c: "45"),
            Question(q: "81 ÷ 9 = ?", a: ["8", "9", "10"], c: "9"),
            Question(q: "√64 = ?", a: ["7", "8", "9"], c: "8"),
            Question(q: "4^2 = ?", a: ["12", "16", "18"], c: "16"),
            Question(q: "7 × 8 = ?", a: ["54", "56", "58"], c: "56"),
            Question(q: "125 ÷ 5 = ?", a: ["20", "25", "30"], c: "25")
        ]
    ]
    
    var questionNumber = 0
    var score = 0
    var quizFinished = false
    var difficulty = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool{
        let checkedAnswer = userAnswer == quiz[difficulty][questionNumber].correctAnswer
        if checkedAnswer {
            score += 1
        }
        return checkedAnswer
    }
    
    func getProgress() -> Float{
        return Float(questionNumber + 1)/Float(quiz[difficulty].count)
    }
    
    func getQuestionText() -> String{
        return quiz[difficulty][questionNumber].text
    }
    
    func getAnswerTexts() -> [String]{
        return quiz[difficulty][questionNumber].answers
    }
    
    func getIsFinished() -> Bool{
        return self.quizFinished
    }
    
    mutating func nextQuestion() {
        if (questionNumber == quiz[difficulty].count - 2) {
            self.quizFinished = true
        }
        if (questionNumber < quiz[difficulty].count - 1) {
            questionNumber += 1
        } else {
            questionNumber = 0
            self.score = 0

        }
    }
    
    func getScore() -> String{
        return String(self.score)
    }
}
