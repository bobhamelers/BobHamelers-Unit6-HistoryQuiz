//
//  QuestionViewController.swift
//  HistoryQuiz
//
//  Created by Bob Hamelers on 11/12/2017.
//  Copyright © 2017 Bob Hamelers. All rights reserved.
//

import UIKit
import FirebaseDatabase

class QuestionViewController: UIViewController {
    
    var questionIndex = 0
    var answersChosenScore = 0
//    var correctAnswersChosen: [Answer] = []
//    var incorrectAnswersChosen: [Answer] = []
    let historyController = HistoryController()
    var results = [Result]()
//    var network: Network?
    
    
    @IBOutlet weak var loadingStackView: UIStackView!
    @IBOutlet weak var boolStackView: UIStackView!
    @IBOutlet weak var boolSecondStackView: UIStackView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!
    
    @IBAction func trueAnswerButtonPressed(_ sender: UIButton) {
        if results[questionIndex].correct_answer == trueButton.currentTitle{
            answersChosenScore += 1
            print(answersChosenScore)
        }
        nextQuestion()
    }
    
    @IBAction func falseAnswerButtonPressed(_ sender: UIButton) {
        if results[questionIndex].correct_answer == falseButton.currentTitle{
            answersChosenScore += 1
        }
        nextQuestion()
    }
    
//    override func viewDidLoad() {
//        print("test")
//        historyController.fetchCompletion { (network) in
//            print("test2")
//            print(network)
//            if let network = network {
//                print(network)
//                DispatchQueue.main.async {
//                    print(network)
////                    self.questions = network.question
//                }
//                self.updateUI()
//            }
//        }
//    }
    
    override func viewDidLoad() {
        boolStackView.isHidden = true
        loadingStackView.isHidden = false
        historyController.fetchCompletion { (results) in
            if let results = results {
                DispatchQueue.main.async {
                    self.results = results
                    self.loadingStackView.isHidden = true
                    self.updateUI()
                }
            }
        }
    }
    
    func updateUI() {
        boolStackView.isHidden = false
        
        let currentResults = results[questionIndex]
        let encodedQuestion = currentResults.question
        let decodedQuestion = String(htmlEncodedString: encodedQuestion)
        let currentQuestion = decodedQuestion
//        let currentCorrectAnswer = currentResults.correct_answer
//        let currentIncorrectAnswer = currentResults.incorrect_answers[0]
        
        navigationItem.title = "Question #\(questionIndex+1)"
        questionLabel.text = currentQuestion
//        trueButton.setTitle(currentCorrectAnswer, for: .normal)
//        falseButton.setTitle(currentIncorrectAnswer, for: .normal)
    }
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < results.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender:
        Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultsViewController = segue.destination as!
            ResultsViewController
            resultsViewController.responsesScore = answersChosenScore
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
// https://stackoverflow.com/questions/25607247/how-do-i-decode-html-entities-in-swift
extension String {
    
    init?(htmlEncodedString: String) {
        
        guard let data = htmlEncodedString.data(using: .utf8) else {
            return nil
        }
        
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            NSAttributedString.DocumentReadingOptionKey(rawValue: NSAttributedString.DocumentAttributeKey.documentType.rawValue): NSAttributedString.DocumentType.html,
            NSAttributedString.DocumentReadingOptionKey(rawValue: NSAttributedString.DocumentAttributeKey.characterEncoding.rawValue): String.Encoding.utf8.rawValue
        ]
        
        guard let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) else {
            return nil
        }
        
        self.init(attributedString.string)
    }
}
