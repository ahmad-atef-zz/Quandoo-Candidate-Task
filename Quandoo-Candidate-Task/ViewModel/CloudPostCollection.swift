
//  CloudPostCollection.swift
//  Quandoo-Candidate-Task
//
//  Created by Ahmad Atef on 7/27/17.
//  Copyright © 2017 Quandoo GmbH. All rights reserved.
//

import Foundation
import Alamofire



public class CloudPostCollection: PostService {
    
    //MARK: - Private Properties -
    private var posts : [Post] = []
    
    
    //MARK: - PostService Methods -
    
    public func loadUserPosts(userId: String,
                              onSuccess: @escaping ([Post]) -> (),
                              onFailure: @escaping (TaskServiceError) -> ()) {
        
        Alamofire.request("\(Router.baseURLString)posts?userId=\(userId)",
            encoding: URLEncoding(destination: .queryString))
            .validate(statusCode: 200..<300)
            .responseJSON{ response in
                
                guard response.result.isSuccess else{
                    return
                }
                if let data = response.data {
                    do {
                        let jsonDictionary = try(JSONSerialization.jsonObject(with: data, options: .mutableContainers)) as![[String:AnyObject]]
                        let remotePosts = Post.from(jsonDictionary)
                        self.posts = remotePosts
                        onSuccess(self.posts)
                        
                    }
                    catch{
                        onFailure(.networkError(error: error.localizedDescription))
                    }
                }
        }
    }
    
    public func numberOfPosts() -> Int {
        return posts.count
    }
    
    public func postAtIndex(index: Int) -> Post {
        return posts[index]
    }
}
