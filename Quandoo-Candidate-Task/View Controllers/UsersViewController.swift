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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    // MARK: - Basic Functionality
    func loadData() {
        viewModel = UserViewModel (view: self)
        viewModel?.loadData()
    }
    
    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow,
            let userPostsPage = segue.destination as? UserPostsViewController else{return}
     
        let user = viewModel?.dataCollector.userAtIndex(index: indexPath.row)
        userPostsPage.userObject = user
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
        let user = viewModel?.dataCollector.userAtIndex(index: indexPath.row)
        self.performSegue(withIdentifier: "userPostsSegue", sender: user)
    }
}



// MARK: - UserViewable
extension UsersViewController : UserViewable{
    
    func onDidStartLoading() {
        print("Loading......")
        spinner.startAnimating()
    }
    
    
    func onDidFinishLoadingData() {
        self.tableView.reloadData()
        spinner.stopAnimating()
    }
    
    func onDidFailLoadingDataWithError(error: String) {
        spinner.stopAnimating()
    }

}
