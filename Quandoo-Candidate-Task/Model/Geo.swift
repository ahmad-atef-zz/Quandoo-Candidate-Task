//
//  Geo.swift
//  Quandoo-Candidate-Task
//
//  Created by Ahmad Atef on 7/27/17.
//  Copyright © 2017 Quandoo GmbH. All rights reserved.
//

import Foundation


public struct Geo {
    public let lat : String
    public let lng : String
    
    public init?(dictionary: [String : Any]) {
        guard
            let lat = dictionary["lat"] as? String,
            let lng = dictionary["lng"] as? String
            else {
                return nil
        }
        self.lat = lat
        self.lng = lng
    }
    
    
    public static func from(_ array: [[String : Any]]) -> [Geo] {
        return array.map { Geo(dictionary: $0) }
            .filter { $0 != nil }
            .map { $0! }
    }
    
}
