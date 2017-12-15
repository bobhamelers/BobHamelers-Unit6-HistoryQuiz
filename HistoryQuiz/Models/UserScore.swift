//
//  UserScore.swift
//  HistoryQuiz
//
//  Created by Bob Hamelers on 14/12/2017.
//  Copyright © 2017 Bob Hamelers. All rights reserved.
//

import Foundation
import FirebaseDatabase

// MARK: UserScore struct
struct UserScore {
    
    let user: String
    let userScore: Int
    
    init(snapshot: DataSnapshot) {
        user = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        userScore = snapshotValue["score"] as! Int
    }
}
