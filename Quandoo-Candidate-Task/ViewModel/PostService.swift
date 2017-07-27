//
//  PostService.swift
//  Quandoo-Candidate-Task
//
//  Created by Ahmad Atef on 7/27/17.
//  Copyright © 2017 Quandoo GmbH. All rights reserved.
//

import Foundation



public protocol PostService{
    
    /// Use this method to load Posts for specific user.
    ///
    /// - Parameters:
    ///   - userId: the id of the selected user to list his posts.
    ///   - onSuccess: Success clousre fire when success on loading user posts.
    ///   - onFailure: Failure clousre fire when error happened in listing user [Post].
    func loadUserPosts(userId: String,
                       onSuccess: @escaping ([Post]) -> (),
                       onFailure: @escaping (TaskServiceError) -> ())
    
    
    /// Use this method to returns number of Posts to be displayed in UIElments, like Tableview.
    ///
    /// - Returns: number  indicateds [Post]count returned from Service Performer.
    func numberOfPosts () -> Int
    
    
    /// Use this method to be like subscript function, that returns Post object at specific given index.
    ///
    /// - Parameter index: index to subscript with it in the Post list.
    /// - Returns: return the Post at speific index.
    
    func postAtIndex (index: Int) -> Post
}
