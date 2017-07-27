//
//  CloudPostCollection.swift
//  Quandoo-Candidate-Task
//
//  Created by Ahmad Atef on 7/27/17.
//  Copyright © 2017 Quandoo GmbH. All rights reserved.
//

import Foundation


class CloudPostCollection: PostService {
    
    
    //MARK: - Private Properties -
    private var posts : [Post] = []
    
    
    //MARK: - PostService Methods -
    func loadUserPosts(userId: String,
                       onSuccess: @escaping ([Post]) -> (),
                       onFailure: @escaping (TaskServiceError) -> ()) {
    }
    
    func numberOfPosts() -> Int {
        return posts.count
    }
    
    func postAtIndex(index: Int) -> Post {
        return posts[index]
    }
}
