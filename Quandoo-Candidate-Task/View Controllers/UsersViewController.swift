//
//  UsersViewController.swift
//  Quandoo-Candidate-Task
//
//  Created by Ahmad Atef on 7/27/17.
//  Copyright © 2017 Quandoo GmbH. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {
    
    //MARK: - Properties -
    var viewModel : UserViewModel?
    
    
    //MARK: - IBOutlet -
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    func loadData() {
        viewModel = UserViewModel (view: self)
        viewModel?.loadData()
    }
}



//MARK: - UITableViewDelegate -

extension UsersViewController : UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel!.dataCollector.numberOfUseres()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let user = viewModel?.dataCollector.userAtIndex(index: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.reuseIdentifier) as! UserCell
        return (viewModel?.setupCell(cell: cell, user: user!))!
    }
}

extension UsersViewController : UserViewable{
    
    func onDidStartLoading() {
        print("Loading......")
    }
    
    
    func onDidFinishLoadingData() {
        self.tableView.reloadData()
    }
    
    func onDidFailLoadingDataWithError(error: String) {
        
    }

}
