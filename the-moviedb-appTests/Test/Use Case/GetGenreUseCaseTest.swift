//
//  GetGenreUseCaseTest.swift
//  the-moviedb-appTests
//
//  Created by Alexandre Henrique on 2/23/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import XCTest
import The_MovieDB_App
@testable import The_MovieDB_App

class GetGenreUseCaseTest: XCTestCase {

    private var useCase: GetGenreUseCase!
    private var comparebleResponse: GenreResponse!
    private var action: ActionBlock!
    private var expectation: XCTestExpectation!
    
    override func setUp() {
        super.setUp()
        
        let bundle       = Bundle.main
        self.useCase     = InjectionUseCase.provideGetGenreUseCase()
        self.expectation = XCTestExpectation(description: "Fetch genres")
        
        self.comparebleResponse = StubFileLoader.loadByFile(fileName: "Genres",
                                                            fileExtension: "json",
                                                            bundle: bundle,
                                                            castType: GenreResponse.self)
        
        StubManager.setUp()
    }

    override func tearDown() {
        StubManager.removeStubs()
        
        self.useCase            = nil
        self.comparebleResponse = nil
        self.action             = nil
        self.expectation        = nil
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
