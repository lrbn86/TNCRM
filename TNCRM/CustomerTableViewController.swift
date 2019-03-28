//
//  CustomerDetailTableViewController.swift
//  TNCRM
//
//  Created by brandon on 3/28/19.
//  Copyright © 2019 Brandon Nguyen. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class CustomerTableViewController: UITableViewController {
    let cellId = "customCell"
    var yourArray = ["Mary Jane", "Elizabeth Worth", "Rachel Sum"]
    override func viewDidLoad() {
        super.viewDidLoad()
        let ref = Database.database().reference()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let name = yourArray[indexPath.row]
        cell.textLabel?.text = name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yourArray.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CustomerDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let vc = segue.destination as! CustomerDetailViewController
                vc.customerName = yourArray[indexPath.row]
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "CustomerDetail", sender: AnyObject?.self )
    }
}
