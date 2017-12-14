//
//  Results.swift
//  HistoryQuiz
//
//  Created by Bob Hamelers on 11/12/2017.
//  Copyright © 2017 Bob Hamelers. All rights reserved.
//  Copyright © 2017 Swift Models Generated from JSON powered by http://www.json4swift.com
//

import Foundation

struct Result : Codable {
    let type : String
    let difficulty : String
    let question : String
    let correct_answer : String
    let incorrect_answers : [String]
    
//    enum CodingKeys: String, CodingKey {
//
//        case type = "type"
//        case difficulty = "difficulty"
//        case question = "question"
//        case correct_answer = "correct_answer"
//        case incorrect_answers = "incorrect_answers"
//    }
    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        type = try values.decodeIfPresent(String.self, forKey: .type)
//        difficulty = try values.decodeIfPresent(String.self, forKey: .difficulty)
//        question = try values.decodeIfPresent(String.self, forKey: .question)
//        correct_answer = try values.decodeIfPresent(String.self, forKey: .correct_answer)
//        incorrect_answers = try values.decodeIfPresent([String].self, forKey: .incorrect_answers)
//    }
    
}
struct Results : Codable {
    
    let results : [Result]
    
//    enum CodingKeys: String, CodingKey {
//
//        case questions = "results"
//    }
    
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        questions = try values.decodeIfPresent([Result].self, forKey: .questions)
//    }
}

