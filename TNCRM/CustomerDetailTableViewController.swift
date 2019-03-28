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


class CustomersTableViewController: UITableViewController {
    
    @IBOutlet weak var customersTable: UITableView!
    var myarray = ["item1", "item2", "item3"]
    let ref = Database.database().reference()
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        ref.child("someid/name").observeSingleEvent(of: .value, with: { (snapshot) in
//
//            let value = snapshot.value as? String
//            self.navigationItem.title = value
//
//
//        })
        
    }
}
