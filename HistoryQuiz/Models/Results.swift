//
//  Results.swift
//  HistoryQuiz
//
//  Created by Bob Hamelers on 11/12/2017.
//  Copyright © 2017 Bob Hamelers. All rights reserved.
//  Copyright © 2017 Swift Models Generated from JSON powered by http://www.json4swift.com
//

import Foundation

// MARK: JSON into struct
struct Result : Codable {
    let type : String
    let difficulty : String
    let question : String
    let correct_answer : String
    let incorrect_answers : [String]
    // Result content
}
struct Results : Codable {
    
    let results : [Result]
    // JSON results dictionary
}

