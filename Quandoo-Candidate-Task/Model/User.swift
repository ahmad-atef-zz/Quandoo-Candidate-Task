//
//  User.swift
//  Quandoo-Candidate-Task
//
//  Created by Ahmad Atef on 7/27/17.
//  Copyright © 2017 Quandoo GmbH. All rights reserved.
//

import Foundation



public struct User {
    
    // MARK: - Instance Properties
    
    public let id : Int
    public let name : String
    public let username : String
    public let email : String
    public let address : Address
    public let phone : String
    public let website : String
    public let company : Company
    
    
    // MARK: - Object Lifecycle
    
    public init?(dictionary: [String : Any]) {
        guard let id = dictionary["id"] as? Int,
            let name = dictionary["name"] as? String,
            let username = dictionary["username"] as? String,
            let email = dictionary["email"] as? String,
            let phone = dictionary["phone"] as? String,
            let website = dictionary["website"] as? String  else {
            return nil
        }
        
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.address = Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: ""))
        self.phone = phone
        self.website = website
        self.company = Company(name: "", catchPhrase: "", bs: "")
    }
    
    
    // MARK: - Load from Dictionary Array
    
    public static func from(_ array: [[String : Any]]) -> [User] {
        return array.map { User(dictionary: $0) }
            .filter { $0 != nil }
            .map { $0! }
    }
}


// MARK: - CustomStringConvertible

extension User : CustomStringConvertible{
    public var description: String{
        return "name: \(self.name), \n id: \(self.id) \n email: \(self.email)"
    }
}

// MARK: - Equatable
extension User : Equatable{
    public static func ==(lhs: User, rhs: User) -> Bool{
        return lhs.id == rhs.id
    }
}

