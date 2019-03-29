//
//  CustomerDetail.swift
//  TNCRM
//
//  Created by brandon on 3/28/19.
//  Copyright © 2019 Brandon Nguyen. All rights reserved.
//

import UIKit

class CustomerDetailViewController: UIViewController {
    
    var customerName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = customerName
    }
    
}
