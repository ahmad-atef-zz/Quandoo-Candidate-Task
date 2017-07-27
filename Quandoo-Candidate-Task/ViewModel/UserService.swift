//
//  TaskService.swift
//  Quandoo-Candidate-Task
//
//  Created by Ahmad Atef on 7/27/17.
//  Copyright © 2017 Quandoo GmbH. All rights reserved.
//

import Foundation



public protocol UserService{
    
    
    /// Use this method to load list of users, this can be done by Cloud consumer or Local one.
    ///
    /// - Parameters:
    ///   - onSuccess: Success Clousre run when success on loading users from the client that implmenting User Service.
    ///   - onFailure: onFailure Clusre fire when error happened in listing the users from the consumer.
    func loadUsers(onSuccess: @escaping ([User]) -> (),
                   onFailure: @escaping (TaskServiceError) -> ())
    
    
    /// Use this method to returns number of users to be displayed in UIElments, like Tableview.
    ///
    /// - Returns: number of users returned from Service Performer.
    func numberOfUseres () -> Int
    
    
    /// Use this method to be like subscript function, that returns user object at specific given index.
    ///
    /// - Parameter index: index to subscript with it in the users list.
    /// - Returns: return the user at speific index.
    func userAtIndex(index : Int) -> User
}
