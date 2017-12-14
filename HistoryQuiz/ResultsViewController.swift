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

    var responsesScore: Int!
    let currentUser = Auth.auth().currentUser!
    let refScore = Database.database().reference().child("highscore")
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    
    @IBOutlet weak var resultScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        resultScoreLabel.text = "Your score is \(responsesScore!)!"
        
        guard let string = currentUser.email else { return }
        if let index = string.range(of: "@")?.lowerBound {
            let substring = string[..<index]
            let email = String(substring)
            print(email)
            let score = ["score": responsesScore as Int]
            refScore.child(email).setValue(score)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
