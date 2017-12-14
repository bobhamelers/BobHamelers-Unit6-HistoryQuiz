//
//  LoginViewController.swift
//  HistoryQuiz
//
//  Created by Bob Hamelers on 10/12/2017.
//  Copyright © 2017 Bob Hamelers. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    // Constants and Variables
    let loginToList = "LoginToList"
    
    // Outlets
    @IBOutlet weak var textFieldLoginEmail: UITextField!
    @IBOutlet weak var textFieldLoginPassword: UITextField!

    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        textFieldLoginEmail.resignFirstResponder()
        textFieldLoginPassword.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
        
        Auth.auth().addStateDidChangeListener() { auth, user in
            if user != nil {
                self.performSegue(withIdentifier: self.loginToList, sender: nil)
            }
        }
    }
    
    // Actions
    @IBAction func loginDidTouch(_ sender: AnyObject) {
        Auth.auth().signIn(withEmail: textFieldLoginEmail.text!,
                           password: textFieldLoginPassword.text!, completion: { (user, error) in if(error != nil){
                            self.createAlert(title: "FAILURE", message: "Your E-mail, Password or both are incorrect or not known")
                            }})
    }
    
    @IBAction func signUpDidTouch(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Register",
                                      message: "Register",
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save",
                                       style: .default) { action in
            
            let emailField = alert.textFields![0]
            let passwordField = alert.textFields![1]
            
            Auth.auth().createUser(withEmail: emailField.text!,
                                   password: passwordField.text!) { user, error in
                if error == nil {
                    Auth.auth().signIn(withEmail: self.textFieldLoginEmail.text!,
                                           password: self.textFieldLoginPassword.text!)
                }
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .default)
        
        alert.addTextField { textEmail in
            textEmail.placeholder = "Enter your email"
        }
        
        alert.addTextField { textPassword in
            textPassword.isSecureTextEntry = true
            textPassword.placeholder = "Enter your password"
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    func createAlert (title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            }))
        self.present(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFieldLoginEmail {
            textFieldLoginPassword.becomeFirstResponder()
        }
        if textField == textFieldLoginPassword {
            textField.resignFirstResponder()
        }
        return true
    }
    
}
