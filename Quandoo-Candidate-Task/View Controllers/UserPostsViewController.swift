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
    
    //MARK: - IBOutlet -
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateCellHightDynamically()
        viewModel = PostViewModel(view: self, userObject: userObject!)
        loadUserPosts()
    }
    
    // MARK: - Basic Functionality
    
    /// Use this function to make the hight of cell Dynamically Calculated.
    func calculateCellHightDynamically() {
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    func loadUserPosts() {
        viewModel?.loadData()
    }
}


//MARK: - UITableViewDelegate -

extension UserPostsViewController : UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel!.dataCollector.numberOfPosts()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let post = viewModel?.dataCollector.postAtIndex(index: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.reuseIdentifier) as! PostCell
        cell.postTitleLabel.text = "\(post!.title)"
        cell.postBodyLabel.text = "\(post!.body)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


//MARK: - PostViewable -
extension UserPostsViewController : PostViewable{
    func onDidStartLoading() {
        print("Loading....")
        spinner.startAnimating()
    }
    
    func onDidFinishLoadingData() {
        self.tableView.reloadData()
        spinner.stopAnimating()
    }
    
    func onDidFailLoadingDataWithError(error: String) {
        print("onDidFailLoadingDataWithError: \(error).")
        spinner.stopAnimating()
    }
}
