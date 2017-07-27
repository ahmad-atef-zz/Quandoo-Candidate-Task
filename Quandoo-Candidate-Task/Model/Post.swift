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
