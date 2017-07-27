//
//  UserCollection.swift
//  Quandoo-Candidate-Task
//
//  Created by Ahmad Atef on 7/27/17.
//  Copyright © 2017 Quandoo GmbH. All rights reserved.
//

import Foundation


public class LocalUserCollection : UserService{
    
    // MARK: - Private Properties
    
    fileprivate var users: [User] = []
    
    
    // MARK: - TaskService Protocol
    
    /// Use this method to load users from User Collection that applies Task service protocol.
    ///
    /// - Parameters:
    ///   - onSuccess: success clousre takes list of users when the users loaded successfully.
    ///   - onFailure: failure clousre that taks TaskServiceError indicating the type of error when failing happend in useres loading.
    
    public func loadUsers(onSuccess: @escaping ([User]) -> (),
                          onFailure: @escaping (TaskServiceError) -> ()) {
        
        loadUsers(fromPlistNamed: "Users") { (localUsers) in
            self.users = localUsers
            onSuccess(self.users)
        }
    }
    
    /// Use this method to calculate total number of loaded users.
    ///
    /// - Returns: number of loaded users.
    public func numberOfUseres() -> Int {
        return self.users.count
    }
    
    
    /// Use this method to load specific user.
    ///
    /// - Parameter index: index to be used to load user from data source that contains the total users.
    /// - Returns: the specific user at the send index.
    public func userAtIndex(index: Int) -> User {
        return users[index]
    }
    
    
    // MARK: - Helper Methods
    /// Use this method to load the users from the plist name in the given bundle.
    ///
    /// - parameter plistName: The plist name
    /// - parameter bundle:    The bundle, have default value to Main Bundle.
    fileprivate func loadUsers(fromPlistNamed plistName: String, in bundle: Bundle = Bundle.main , success: ([User]) -> ()) {
        let path = bundle.path(forResource: plistName, ofType: "plist")!
        let array = NSArray(contentsOfFile: path) as! [[String : Any]]
        let localUsers = User.from(array)
        success(localUsers)
    }
    
    public func loadDataLocally() {
        print("KOKOK")
        loadUsers(fromPlistNamed: "Users") { (localUsers) in
            self.users = localUsers
        }
    }
}

