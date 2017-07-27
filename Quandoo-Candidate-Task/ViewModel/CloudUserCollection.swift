//
//  CloudUserCollection.swift
//  Quandoo-Candidate-Task
//
//  Created by Ahmad Atef on 7/27/17.
//  Copyright © 2017 Quandoo GmbH. All rights reserved.
//

import Foundation
import Alamofire

class CloudUserCollection: UserService {
    
    // MARK: - Private Properties
    private var users: [User] = []
    
    
    // MARK: - TaskService Protocol
    
    /// Use this method to load users from User Collection that applies Task service protocol.
    ///
    /// - Parameters:
    ///   - onSuccess: success clousre takes list of users when the users loaded successfully.
    ///   - onFailure: failure clousre that taks TaskServiceError indicating the type of error when failing happend in useres loading.
    
    func loadUsers(onSuccess: @escaping ([User]) -> (),
                   onFailure: @escaping (TaskServiceError) -> ()) {
        
        Alamofire.request(Router.listUsers())
            .validate(statusCode: 200..<300)
            .responseJSON{ response in
                
                guard response.result.isSuccess else{
                    return
                }
                if let data = response.data {
                    do {
                        let jsonDictionary = try(JSONSerialization.jsonObject(with: data, options: .mutableContainers)) as![[String:AnyObject]]
                        let remoteUsers = User.from(jsonDictionary)
                        self.users = remoteUsers
                        onSuccess(self.users)
                    }
                    catch{
                        onFailure(.networkError(error: error.localizedDescription))
                    }
                }
        }
    }
    
    
    /// Use this method to calculate total number of loaded users.
    ///
    /// - Returns: number of loaded users.
    
    func numberOfUseres() -> Int {
        return self.users.count
    }
    
    
    
    /// Use this method to load specific user.
    ///
    /// - Parameter index: index to be used to load user from data source that contains the total users.
    /// - Returns: the specific user at the send index.
    
    func userAtIndex(index: Int) -> User {
        return users[index]
    }
    
    
    
    /// Use this method to load user [Post].
    ///
    /// - Parameters:
    ///   - userId: the id of the user that you want to load his posts.
    ///   - onSuccess: success clousre with list of loaded posts for the user.
    ///   - onFailure: failur clousre when error occures on loading user posts with a TaskServiceError object.
    
    func loadUserPosts(userId: String,
                       onSuccess: @escaping ([Post]) -> (),
                       onFailure: @escaping (TaskServiceError) -> ()) {
        
    }
}
