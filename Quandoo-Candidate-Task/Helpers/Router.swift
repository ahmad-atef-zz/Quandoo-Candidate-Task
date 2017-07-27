//
//  Router.swift
//  Quandoo-Candidate-Task
//
//  Created by Ahmad Atef on 7/27/17.
//  Copyright © 2017 Quandoo GmbH. All rights reserved.
//

import Foundation
import Alamofire

struct CompassPoint {
    static let INTERVIEWS = "https://jsonplaceholder.typicode.com/"
    static let STAGING = ""
    static let PRODUCTION = ""
}

enum HTTPMethod : String {
    case get = "GET"
    case post = "POST"
}

let timeoutInterval = TimeInterval(10 * 1000)

public enum Router : URLRequestConvertible{
    
    static let baseURLString = CompassPoint.INTERVIEWS
    
    case listUsers()
    case listUserPosts(userId: String)
    
    public func asURLRequest() throws -> URLRequest{
        let result : (path : String, method : HTTPMethod) = {
            
            switch self {
            case .listUsers():
                return ("users",.get)
            case .listUserPosts(let userId):
                return("posts/\(userId)", .get)
            }
            
        }()
        
        let url = URL(string: Router.baseURLString)
        var request = URLRequest(url: (url?.appendingPathComponent(result.path))!)
        print(request)
        request.httpMethod = result.method.rawValue
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        request.timeoutInterval = timeoutInterval
        
        return request
    }
}
