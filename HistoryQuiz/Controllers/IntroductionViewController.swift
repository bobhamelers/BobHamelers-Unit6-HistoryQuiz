//
//  IntroductionViewController.swift
//  HistoryQuiz
//
//  Created by Bob Hamelers on 11/12/2017.
//  Copyright © 2017 Bob Hamelers. All rights reserved.
//

import UIKit
import FirebaseAuth

class IntroductionViewController: UIViewController {

    // MARK: Properties
    var user: User!
    
    // MARK: Actions
    @IBAction func logoutDidTouch(_ sender: AnyObject) {
        try! Auth.auth().signOut()
        dismiss(animated: true, completion: nil)
        // Log out and go back to LoginViewController
    }
    
    @IBAction func unwindToQuizIntroduction(segue:
        UIStoryboardSegue) {
        // Go to QuestionViewController
    }
    
    // MARK: UIViewController IntroductionViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load IntroductionView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
