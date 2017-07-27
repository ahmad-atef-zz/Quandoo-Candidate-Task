//
//  Post.swift
//  Quandoo-Candidate-Task
//
//  Created by Ahmad Atef on 7/27/17.
//  Copyright © 2017 Quandoo GmbH. All rights reserved.
//

import Foundation


public struct Post {
    
    public let userId : Int
    public let id : Int
    public let title : String
    public let body : String
    
    // MARK: - Object Lifecycle
    public init?(dictionary: [String : Any]) {
        guard let id = dictionary["id"] as? Int,
            let userId = dictionary["userId"] as? Int,
            let title = dictionary["title"] as? String,
            let body = dictionary["body"] as? String else {
                return nil
        }
        self.id = id
        self.userId = userId
        self.title = title
        self.body = body
    }
    
    // MARK: - Load from Dictionary Array
    public static func from(_ array: [[String : Any]]) -> [Post] {
        return array.map { Post(dictionary: $0) }
            .filter { $0 != nil }
            .map { $0! }
    }
}

extension Post : CustomStringConvertible{
    public var description: String{
        return "Post Id: \(self.id), title : \(self.title)"
    }
}
extension Post : Equatable{
    public static func ==(lhs: Post, rhs: Post) -> Bool{
        return lhs.id == rhs.id
    }
}
