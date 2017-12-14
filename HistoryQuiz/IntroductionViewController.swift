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

    var user: User!
    
    @IBAction func logoutDidTouch(_ sender: AnyObject) {
        try! Auth.auth().signOut()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func unwindToQuizIntroduction(segue:
        UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Auth.auth().addStateDidChangeListener { auth, user in
//            guard let user = user else { return }
//            self.user = User(authData: user)
//        }
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
