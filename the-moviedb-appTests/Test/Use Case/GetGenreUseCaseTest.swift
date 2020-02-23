//
//  GetGenreUseCase.swift
//  the-moviedb-appTests
//
//  Created by Alexandre Henrique on 2/23/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import XCTest
import the_moviedb_app
@testable import the_moviedb_app

class GetGenreUseCaseTest: XCTestCase {

    private var useCase: GetGenreUseCase!
    private var comparebleResponse: GenreResponse!
    private var responseObject: [GenreEntity]!
    private var action: ActionBlock!
    private var didSucceed: Bool!
    private var didFailed: Bool!
    
    private var expectation: XCTestExpectation!
    
    override func setUp() {
        super.setUp()
        
        let bundle       = Bundle(for: type(of: self))
        self.useCase     = InjectionUseCase.provideGetGenreUseCase()
        self.expectation = XCTestExpectation(description: "Fetch genres")
        
        self.comparebleResponse = StubFileLoader.loadByFile(fileName: "Genres",
                                                            fileExtension: "json",
                                                            bundle: bundle,
                                                            castType: GenreResponse.self)
        
        StubManager.setUp(bundle: bundle)
    }

    override func tearDown() {
        StubManager.removeStubs()
        
        self.useCase        = nil
        self.responseObject = nil
        self.responseObject = nil
        self.didSucceed     = nil
        self.didFailed      = nil
    }
    
    func testWhenFetchingMovieGenres() throws {
        
        try given("An valid environment") {
            self.action = ActionBlock() {
                self.useCase.fetchMovieGenres { (response) in
                    response.onSuccess { (genreEntities) in
                        XCTAssertEqual(genreEntities.first?.id, self.comparebleResponse.genres.first?.id)
                        XCTAssertEqual(genreEntities.count, self.comparebleResponse.genres.count)
                        self.expectation.fulfill()
                    }
                    
                    response.onFailed { (_) in
                        self.didFailed = true
                    }
                }
            }
        }
        
        try when("Executing the given block") {
            execute(action: self.action) {
                self.didSucceed     = false
                self.responseObject = []
            }
        }
        
        try then("It should have matched the given genres") {
            wait(for: [self.expectation], timeout: 3.0)
        }
        
    }

}
