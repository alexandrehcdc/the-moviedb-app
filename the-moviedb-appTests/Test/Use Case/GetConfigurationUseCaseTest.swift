//
//  GetConfigurationUseCaseTest.swift
//  the-moviedb-appTests
//
//  Created by Alexandre Henrique on 2/23/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import XCTest
import The_MovieDB_App
@testable import The_MovieDB_App

class GetConfigurationUseCaseTest: XCTestCase {
    
    private var useCase: GetConfigurationUseCase!
    private var comparebleResponse: [CountryResponse]!
    private var action: ActionBlock!
    private var expectation: XCTestExpectation!
    
    override func setUp() {
        super.setUp()
        
        let bundle       = Bundle.main
        self.useCase     = InjectionUseCase.provideGetConfigurationUseCase()
        self.expectation = XCTestExpectation(description: "Fetch countries")
        
        self.comparebleResponse = StubFileLoader.loadByFile(fileName: "Countries",
                                                            fileExtension: "json",
                                                            bundle: bundle,
                                                            castType: [CountryResponse].self)
        
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
                self.useCase.fetchCountries() { (response) in
                    response.onSuccess { (countriesEntities) in
                        XCTAssertEqual(countriesEntities.first?.isoCode, self.comparebleResponse.first?.iso_3166_1)
                        XCTAssertEqual(countriesEntities.count, self.comparebleResponse.count)
                        self.expectation.fulfill()
                    }
                }
            }
        }

        try when("Executing the given block") {
            execute(action: self.action) { }
        }

        try then("It should have matched the given countries") {
            wait(for: [self.expectation], timeout: 3.0)
        }

    }
    
}
