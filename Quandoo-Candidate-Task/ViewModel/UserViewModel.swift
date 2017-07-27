//
//  UserViewModel.swift
//  Quandoo-Candidate-Task
//
//  Created by Ahmad Atef on 7/27/17.
//  Copyright © 2017 Quandoo GmbH. All rights reserved.
//

import Foundation


// MARK: - UserViewable
/// Protcol for all UserViewable, the consumers are someone who is intersted in implmenting the User Viewing functions, like reloading data or Showing Errors.

public protocol UserViewable {
    func onDidStartLoading()
    func onDidFinishLoadingData()
    func onDidFailLoadingDataWithError(error:String)
}



// MARK: - UserDataSourceProtcol
/// Protocol for all User data source operations like loading data, from Cloud or Local service. Use this as a data source for View Model.
public protocol UserDataSourceProtcol {
    
    /// Use this method to list data from any diffrent services [Remote or Local].
    func loadData()
}


extension UserDataSourceProtcol{
    
    /// Use this Optional Function to Configure Use cell, NOT every datasource View model Must iplment it, It's optionalm you can implment it and make it reflect on your ViewModel calss like @UserViewModel or to leave it without projection on your class.
    ///
    /// - Parameters:
    ///   - cell: to be Configured cell
    ///   - user: data for the cell
    /// - Returns: Readlly Configured cell
    public func setupCell(cell : UserCell, user :User) -> UserCell { return UserCell() }
}


/// Enum to switch between Data Collection Types [Remote - Local]
///
/// - local: load users from Mock Object.
/// - remote: load users from API side.

public enum DataCollectorType {
    case local, remote
}



public class UserViewModel : UserDataSourceProtcol{
    
    // MARK: - Injected Properties
    let dataCollector : UserService = UsersDataCollectorFactory.getDataCollection(type: .remote)
    private let delegateView : UserViewable
    
    // MARK: - Object Lifecycle
    init(view : UserViewable) {
        self.delegateView = view
    }
    
    
    // MARK: - UserDataSourceProtcol
    public func loadData(){
        delegateView.onDidStartLoading()
        dataCollector.loadUsers(onSuccess: { (result) in
            self.delegateView.onDidFinishLoadingData()
            
        }) { (error) in
            
            self.delegateView.onDidFailLoadingDataWithError(error: error.description)
        }
    }
    
    func setupCell(cell : UserCell, user :User) -> UserCell {
        
        cell.nameLabel.text = user.name
        cell.usernameLabel.text = user.username
        cell.emailLabel.text = user.email
        cell.addressLabel.text = "\(user.address.street), \(user.address.suite),\(user.address.city),\(user.address.zipcode)"
        return cell
    }
}



//MARK: - UsersDataCollectorFactory -
public class UsersDataCollectorFactory {
    
    /// Use this class method to generate UserService instance based on the dataCollectorType instance type.
    ///
    /// - Parameter type: DataCollectorType enum and based on thatm the type of Service are Returned.
    /// - Returns: User service instance that can load users.
    class func getDataCollection(type : DataCollectorType) -> UserService {
        switch type {
        case .local:
            return LocalUserCollection()
        case .remote:
            return CloudUserCollection()
        }
    }
    
}
