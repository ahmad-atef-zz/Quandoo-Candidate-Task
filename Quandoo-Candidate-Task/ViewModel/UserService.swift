//
//  TaskService.swift
//  Quandoo-Candidate-Task
//
//  Created by Ahmad Atef on 7/27/17.
//  Copyright © 2017 Quandoo GmbH. All rights reserved.
//

import Foundation


protocol UserDataSourceProtcol {}

public protocol UserService{
    
    func loadUsers(onSuccess: @escaping ([User]) -> (),
                   onFailure: @escaping (TaskServiceError) -> ())
    
    func numberOfUseres () -> Int
    
    func userAtIndex(index : Int) -> User
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - userId: <#userId description#>
    ///   - onSuccess: <#onSuccess description#>
    ///   - onFailure: <#onFailure description#>
    func loadUserPosts(userId: String,
                       onSuccess: @escaping ([Post]) -> (),
                       onFailure: @escaping (TaskServiceError) -> ())
}
