//
//  UpcomingMoviesTest.swift
//  the-moviedb-appTests
//
//  Created by Alexandre Henrique on 2/23/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import XCTest
import the_moviedb_app
@testable import the_moviedb_app

class UpcomingMoviesTest: XCTestCase {
    
    private var viewController: UpcomingMoviesViewController!
    private var presenter: UpcomingMoviesPresenterMock!

    override func setUp() {
        self.viewController = UpcomingMoviesViewController(collectionViewLayout: UICollectionViewFlowLayout())
        self.presenter      = UpcomingMoviesPresenterMock()
        
    }

    override func tearDown() {
        self.viewController = nil
        self.presenter      = nil
    }
    
    func testIfFetchGenresIsBeingCalled() throws {
        try given("A valid setup") {
            self.viewController.presenter = self.presenter
        }
        try when("Initializing the view controller") {
            self.viewController.viewDidLoad()
        }
        try then("It should have called fetch genres") {
            XCTAssertTrue(self.presenter.fetchGenresWasCalled)
        }
    }
    
    func testIfFetchMoviesIsBeingCalled() throws {
        try given("A valid setup") {
            self.viewController.presenter = self.presenter
        }
        try when("Initializing the view controller and orchestrating the needed methods") {
            self.viewController.viewDidLoad()
            self.viewController.invalidateCurrentMovieSet()
        }
        try then("It should have called fetch movies") {
            XCTAssertTrue(self.presenter.fetchMoviesWasCalled)
        }
    }
    
    func testIfFetchCountriesIsBeingCalled() throws {
        try given("A valid setup") {
            self.viewController.presenter = self.presenter
        }
        try when("Initializing the view controller and orchestrating the needed methods") {
            self.viewController.viewDidLoad()
            self.viewController.otherRegionPicked(action: UIAlertAction())
        }
        try then("It should have called fetch movies") {
            XCTAssertTrue(self.presenter.fetchCountriesWasCalled)
        }
    }

}
