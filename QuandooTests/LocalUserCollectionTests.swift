//
//  LocalUserCollectionTests.swift
//  Quandoo-Candidate-Task
//
//  Created by Ahmad Atef on 7/27/17.
//  Copyright © 2017 Quandoo GmbH. All rights reserved.
//

import XCTest
@testable import Quandoo_Candidate_Task

class LocalUserCollectionTests: XCTestCase {
    
    var localCollection : UserService!
    
    override func setUp() {
        super.setUp()
        localCollection = LocalUserCollection()
        localCollection.loadDataLocally()
        
    }
    
    func testLocalCollectionHasExpectedValue() {
        XCTAssert(localCollection.numberOfUseres() == 3, "Local Collection didn't have Expected Value!")
    }
    
    
    func testLocalCollectionHasExpectedValues() {
        let testingUser = localCollection.userAtIndex(index: 0)
        XCTAssert(testingUser.id == 1 && testingUser.name == "Ahmad Atef", "Local Collection didn't have Expected Values!")
    }
    
}
