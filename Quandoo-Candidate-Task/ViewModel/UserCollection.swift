//
//  UserCollection.swift
//  Quandoo-Candidate-Task
//
//  Created by Ahmad Atef on 7/27/17.
//  Copyright © 2017 Quandoo GmbH. All rights reserved.
//

import Foundation


public class UserCollection {
    
    // MARK: - Internal Properties
    
    internal var _users: [User] = []
    
    public func loadUsers() {
        loadPancakeHouses("Users", in: Bundle.main)
    }
    
    
    /// Use this method to load the users from the plist name in the given bundle.
    ///
    /// - parameter plistName: The plist name
    /// - parameter bundle:    The bundle
    private func loadPancakeHouses(_ plistName: String, in bundle: Bundle) {
        let path = bundle.path(forResource: plistName, ofType: "plist")!
        let array = NSArray(contentsOfFile: path) as! [[String : Any]]
        _users = User.from(array)
        print(_users.count)
    }
}
