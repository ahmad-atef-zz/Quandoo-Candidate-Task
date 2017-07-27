//
//  UserPostsViewController.swift
//  Quandoo-Candidate-Task
//
//  Created by Ahmad Atef on 7/27/17.
//  Copyright © 2017 Quandoo GmbH. All rights reserved.
//

import UIKit

class UserPostsViewController: UIViewController {

    //MARK: - Properties -
    var userObject : User?
    var viewModel : PostViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = PostViewModel(view: self, userObject: userObject!)
        loadUserPosts()
        
    }
    
    func loadUserPosts() {
        viewModel?.loadData()
    }
}



extension UserPostsViewController : PostViewable{
    func onDidStartLoading() {
        print("Loading....")
    }
    
    func onDidFinishLoadingData() {
        
    }
    
    func onDidFailLoadingDataWithError(error: String) {
        print("onDidFailLoadingDataWithError: \(error).")
    }
}
