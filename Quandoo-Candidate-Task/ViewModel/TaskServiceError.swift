//
//  TaskServiceError.swift
//  Quandoo-Candidate-Task
//
//  Created by Ahmad Atef on 7/27/17.
//  Copyright © 2017 Quandoo GmbH. All rights reserved.
//

import Foundation


public enum TaskServiceError : Error{
    case networkError(error: String)
    case unknown
}


extension TaskServiceError : CustomStringConvertible{
    public var description: String{
        switch self {
        case .networkError(let error):
            return "Network Error with description : \(error)"
        case .unknown:
            return "Unknown"
        }
    }
}
