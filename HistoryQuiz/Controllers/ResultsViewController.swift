//
//  ResultsViewController.swift
//  HistoryQuiz
//
//  Created by Bob Hamelers on 11/12/2017.
//  Copyright © 2017 Bob Hamelers. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ResultsViewController: UIViewController {

    // MARK: Properties
    var responsesScore: Int!
    let currentUser = Auth.auth().currentUser!
    let refScore = Database.database().reference().child("highscore")
    
    // MARK: Outlets
    @IBOutlet weak var resultAnswerLabel: UILabel!
    
    @IBOutlet weak var resultScoreLabel: UILabel!
    
    // MARK: UIViewController ResultsViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        resultScoreLabel.text = "Your score is \(responsesScore!)!"
        // Load ResultsView, hide navigationhide and show score
        
        guard let string = currentUser.email else { return }
        if let index = string.range(of: "@")?.lowerBound {
            let substring = string[..<index]
            let email = String(substring)
            print(email)
            let score = ["score": responsesScore as Int]
            refScore.child(email).setValue(score)
            // convert e-mail into user and score
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
