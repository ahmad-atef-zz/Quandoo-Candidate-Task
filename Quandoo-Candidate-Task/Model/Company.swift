//
//  Company.swift
//  Quandoo-Candidate-Task
//
//  Created by Ahmad Atef on 7/27/17.
//  Copyright © 2017 Quandoo GmbH. All rights reserved.
//

import Foundation


public struct Company {
    public let name : String
    public let catchPhrase : String
    public let bs : String
    
    
    public init?(dictionary: [String : Any]) {
        guard
            let name = dictionary["name"] as? String,
            let catchPhrase = dictionary["catchPhrase"] as? String,
            let bs = dictionary["bs"] as? String
            else {
                return nil
        }
        self.name = name
        self.catchPhrase = catchPhrase
        self.bs = bs
    }
    
    
    public static func from(_ array: [[String : Any]]) -> [Company] {
        return array.map { Company(dictionary: $0) }
            .filter { $0 != nil }
            .map { $0! }
    }
}
