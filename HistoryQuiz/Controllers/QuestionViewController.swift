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
    
    // MARK: Properties
    var questionIndex = 0
    var answersChosenScore = 0
    let historyController = HistoryController()
    var results = [Result]()
    
    // MARK: Outlets
    @IBOutlet weak var loadingStackView: UIStackView!
    @IBOutlet weak var boolStackView: UIStackView!
    @IBOutlet weak var boolSecondStackView: UIStackView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!
    
    // MARK: Actions
    @IBAction func trueAnswerButtonPressed(_ sender: UIButton) {
        if results[questionIndex].correct_answer == trueButton.currentTitle{
            answersChosenScore += 1
            print(answersChosenScore)
        }
        nextQuestion()
        // TrueAnswerButtonPressed function and nextQuestion call
    }
    
    @IBAction func falseAnswerButtonPressed(_ sender: UIButton) {
        if results[questionIndex].correct_answer == falseButton.currentTitle{
            answersChosenScore += 1
        }
        nextQuestion()
        // FalseAnswerButtonPressed function and nextQuestion call
    }
    
    // MARK: UIViewController QuestionViewController
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
        // LoadingStack is seeable and call for updateUI when has JSON
    }
    
    func updateUI() {
        boolStackView.isHidden = false
        
        let currentResults = results[questionIndex]
        let encodedQuestion = currentResults.question
        let decodedQuestion = String(htmlEncodedString: encodedQuestion)
        let currentQuestion = decodedQuestion
        
        navigationItem.title = "Question #\(questionIndex+1)"
        questionLabel.text = currentQuestion
        // UpdateUI function, BoolStack is seeable and some properties
    }
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < results.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
        // Go to next question, except when it is the last question
    }
    override func prepare(for segue: UIStoryboardSegue, sender:
        Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultsViewController = segue.destination as!
            ResultsViewController
            resultsViewController.responsesScore = answersChosenScore
        }
        // Prepare for ResultsViewController
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
// MARK: SOURCE: https://stackoverflow.com/questions/25607247/how-do-i-decode-html-entities-in-swift extension with some own changes to convert html entities
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
