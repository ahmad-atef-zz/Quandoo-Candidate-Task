//
//  FirstViewController.swift
//  Quandoo-Candidate-Task
//
//  Created by Ahmad Atef on 7/27/17.
//  Copyright © 2017 Quandoo GmbH. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        LocalUserCollection().loadUsers(onSuccess: { (users) in
            print(users.count)
        }) { (error) in
            print(error.description)
        }
     
        CloudUserCollection().loadUsers(onSuccess: { (users) in
            print(users.count)
        }) { (error) in
            print(error)
        }
    }
}

