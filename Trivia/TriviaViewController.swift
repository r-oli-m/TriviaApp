//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Reva Mahto on 3/11/24.
//

import UIKit

class TriviaViewController: UIViewController {
    
    @IBOutlet weak var qNumLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet var answerButtons: [UIButton]!
    
    var questions: [TriviaQuestion] = []
    var currentQuestionIndex = 0
    var score = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = [
            
            TriviaQuestion(question: "Which team performed the song 'Easy'", correctAnswer: "LE SSERAFIM", wrongAnswers: ["TXT", "New Jeans", "(G)I-DLE"], category: .kpop),
            TriviaQuestion(question: "Which K-pop group performed the song 'Dynamite'?", correctAnswer: "BTS", wrongAnswers: ["EXO", "Blackpink", "TWICE"], category: .kpop),
            TriviaQuestion(question: "What type of tea is typically used in traditional boba drinks?", correctAnswer: "Black tea", wrongAnswers: ["Green tea", "Oolong tea", "White tea"], category: .boba),
            TriviaQuestion(question: "What is the tapioca pearl in boba made from?", correctAnswer: "Cassava root", wrongAnswers: ["Rice flour", "Wheat flour", "Potato starch"], category: .boba),
            TriviaQuestion(question: "Who founded Apple Inc.?", correctAnswer: "Steve Jobs", wrongAnswers: ["Bill Gates", "Mark Zuckerberg", "Elon Musk"], category: .tech),
            TriviaQuestion(question: "What does 'HTTP' stand for in web technology?", correctAnswer: "Hypertext Transfer Protocol", wrongAnswers: ["Hyperlink Text Transfer Protocol", "Hypertext Transmission Protocol", "High Transmission Transfer Protocol"], category: .tech)
        ]
        
        // Display first question
        displayQuestion()
    }
    
    func displayQuestion() {
        let currentQuestion = questions[currentQuestionIndex]
        
        qNumLabel.text = "Question \(currentQuestionIndex + 1)"
        categoryLabel.text = "Category:  \(currentQuestion.category.rawValue)"
        questionLabel.text = currentQuestion.question
        
        let shuffledAnswers = currentQuestion.shuffledAnswers
        for (index, button) in answerButtons.enumerated() {
            button.setTitle(shuffledAnswers[index], for: .normal)
        }
    }
    
    func checkAnswer(selectedAnswer: String) {
        let currentQuestion = questions[currentQuestionIndex]
        
        if selectedAnswer == currentQuestion.correctAnswer {
            score += 1
        }
        
        // Move to the next question or show score
        currentQuestionIndex += 1
        
        if currentQuestionIndex < questions.count {
            displayQuestion()
        } else {
            showScore()
        }
    }
    
    func showScore() {
        // Show the score using an alert
        let alert = UIAlertController(title: "Quiz Finished", message: "Your score is \(score) out of \(questions.count)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        if let selectedAnswer = sender.currentTitle {
            print("pressed option")
            checkAnswer(selectedAnswer: selectedAnswer)
        }
    }
}

