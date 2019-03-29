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
    let ref = Database.database().reference(withPath: "Customers")
    let cellId = "customCell"
    var customersArray = [String]()
    var count = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
//
//        // TODO Make a separate function for this operation
//        for customerName in customersArray {
//            ref.child("Customers").child("Customer_\(count)").setValue(["Name":customerName, "Service": "Manicure"])
//            count+=1
//        }
//
        ref.observe(.childAdded) { (snapshot) in
            let snapshotValue = snapshot.value as! NSDictionary
            let customerName = snapshotValue["Name"]
            //            let serviceName = snapshotValue["Service"]
            self.customersArray.append(customerName as! String)
            self.tableView.reloadData()
            
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let name = customersArray[indexPath.row]
        cell.textLabel?.text = name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customersArray.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CustomerDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let vc = segue.destination as! CustomerDetailViewController
                vc.customerName = customersArray[indexPath.row]
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "CustomerDetail", sender: AnyObject?.self )
    }
}
