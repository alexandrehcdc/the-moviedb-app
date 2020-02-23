//
//  GetMovieUseCaseTests.swift
//  the-moviedb-appTests
//
//  Created by Alexandre Henrique on 2/23/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import XCTest
import the_moviedb_app
@testable import the_moviedb_app

class GetMovieUseCaseTests: XCTestCase {
    
    override class func setUp() {
        StubManager.setUp()
    }
    
    override func tearDown() {
        StubManager.removeStubs()
    }
    
}

