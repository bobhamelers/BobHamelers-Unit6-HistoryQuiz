//
//  User.swift
//  HistoryQuiz
//
//  Created by Bob Hamelers on 10/12/2017.
//  Copyright © 2017 Bob Hamelers. All rights reserved.
//

import Foundation
import FirebaseAuth

// MARK: User struct for FireBase
struct User {
    
    let uid: String
    let email: String
    
    init(authData: User) {
        uid = authData.uid
        email = authData.email
    }
    
    init(uid: String, email: String) {
        self.uid = uid
        self.email = email
    }
}
