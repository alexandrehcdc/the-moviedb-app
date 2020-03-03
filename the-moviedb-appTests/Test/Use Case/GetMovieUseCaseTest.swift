//
//  GetMovieUseCaseTest.swift
//  the-moviedb-appTests
//
//  Created by Alexandre Henrique on 2/23/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import XCTest
import The_MovieDB_App
@testable import The_MovieDB_App

class GetMovieUseCaseTest: XCTestCase {
    
    private var useCase: GetMovieUseCase!
    private var comparebleResponse: MovieResponse!
    private var action: ActionBlock!
    private var expectation: XCTestExpectation!
    
    override func setUp() {
        super.setUp()
        
        let bundle       = Bundle.main
        self.useCase     = InjectionUseCase.provideGetMovieUseCase()
        self.expectation = XCTestExpectation(description: "Fetch Movies")
        
        self.comparebleResponse = StubFileLoader.loadByFile(fileName: "UpcomingMovies",
                                                            fileExtension: "json",
                                                            bundle: bundle,
                                                            castType: MovieResponse.self)
        
        StubManager.setUp()
    }
    
    override func tearDown() {
        StubManager.removeStubs()
        
        self.useCase            = nil
        self.comparebleResponse = nil
        self.action             = nil
        self.expectation        = nil
    }
    
    func testWhenFetchingUpcomingMovie() throws {

        try given("An valid environment") {
            self.action = ActionBlock() {
                self.useCase.fetchUpcomingMovies(page: 1, region: "US") { (response) in
                    response.onSuccess { (moviesEntities) in
                        
                        XCTAssertEqual(moviesEntities.first?.id, self.comparebleResponse.results.first?.id)
                        XCTAssertEqual(moviesEntities.count, self.comparebleResponse.results.count)
                        self.expectation.fulfill()
                    }
                }
            }
        }

        try when("Executing the given block") {
            execute(action: self.action) { }
        }

        try then("It should have matched the given genres") {
            wait(for: [self.expectation], timeout: 3.0)
        }

    }
    
}

