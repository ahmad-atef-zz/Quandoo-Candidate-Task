//
//  Address.swift
//  Quandoo-Candidate-Task
//
//  Created by Ahmad Atef on 7/27/17.
//  Copyright © 2017 Quandoo GmbH. All rights reserved.
//

import Foundation


public struct Address {
    public let street : String
    public let suite : String
    public let city : String
    public let zipcode : String
    public let geo : Geo
    
    
    public init?(dictionary: [String : Any]) {
        guard
            let street = dictionary["street"] as? String,
            let suite = dictionary["suite"] as? String,
            let city = dictionary["city"] as? String,
            let zipcode = dictionary["zipcode"] as? String,
            let geo = dictionary ["geo"] as? [String : Any]
            else {
                return nil
        }
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
        self.geo = Geo(dictionary: geo)!
    }
    
    
    public static func from(_ array: [[String : Any]]) -> [Address] {
        return array.map { Address(dictionary: $0) }
            .filter { $0 != nil }
            .map { $0! }
    }
    
}
