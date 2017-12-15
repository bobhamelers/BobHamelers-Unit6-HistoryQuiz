//
//  HistoryController.swift
//  HistoryQuiz
//
//  Created by Bob Hamelers on 11/12/2017.
//  Copyright © 2017 Bob Hamelers. All rights reserved.
//

import UIKit
import Foundation

class HistoryController{
    
    // MARK: Global Constant shared HistoryController
    static let shared = HistoryController()
    
    // MARK: Completion function to decode JSON from API with checks
    func fetchCompletion(completion: @escaping ([Result]?) -> Void) {
        let url = URL(string: "https://opentdb.com/api.php?amount=25&category=23&type=boolean")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data,
                let results = try? jsonDecoder.decode(Results.self, from: data) {
                completion(results.results)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}
