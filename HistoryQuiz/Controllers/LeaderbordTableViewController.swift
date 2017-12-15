//
//  LeaderbordTableViewController.swift
//  HistoryQuiz
//
//  Created by Bob Hamelers on 14/12/2017.
//  Copyright © 2017 Bob Hamelers. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class LeaderbordTableViewController: UITableViewController {
    
    // MARK: Properties
    var users: [UserScore] = []
    let currentUser = Auth.auth().currentUser!
    let refScore = Database.database().reference().child("highscore")

    // MARK: UITableViewController LeaderbordTableViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load LeaderbordTableView

        refScore.queryOrdered(byChild: "score").observe(.value, with: { snapshot in
            var newUsers: [UserScore] = []
            
            for item in snapshot.children {
                let userScore = UserScore(snapshot: item as! DataSnapshot)
                newUsers.append(userScore)
            }
            
            self.users = newUsers
            self.tableView.reloadData()
        })
        // Write scores from database by users into list newUsers for tableview
        
        tableView.allowsSelection = false
        // Can't select tables in leaderbord
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
        // Count amount of tables for tableview
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let totalUsers = users.reversed()[indexPath.row]
        cell.textLabel?.text = totalUsers.user
        cell.detailTextLabel?.text = String(totalUsers.userScore)
        return cell
        // Set information sorted in the righ tableview with idetifier
    }
}
