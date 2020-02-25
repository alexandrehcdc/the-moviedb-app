//
//  UpcomingMoviesViewControllerTest.swift
//  the-moviedb-appTests
//
//  Created by Alexandre Henrique on 2/24/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import XCTest
import the_moviedb_app
@testable import the_moviedb_app

class UpcomingMoviesViewControllerTest: XCTestCase {

    private var viewController: UpcomingMoviesViewController!
    private var movies: [MovieDTO]!
    private var filteredMovies: [MovieDTO]!
    private var presenter: UpcomingMoviesPresenterMock!
    
    override func setUp() {
        super.setUp()
        
        self.viewController = UpcomingMoviesViewController(collectionViewLayout: UICollectionViewFlowLayout())
        
        self.presenter = UpcomingMoviesPresenterMock()
        
        self.viewController.loadViewIfNeeded()
    }

    override func tearDown() {
        self.viewController = nil
        self.movies         = nil
        self.filteredMovies = nil
        self.presenter      = nil
    }
    
    func testIfSetupWorksWithValidMoviesDTO() throws {
        try given("A valid setup") {
            self.viewController.presenter = self.presenter
            self.movies                   = MovieBuilder()
                                                .build(amount: 10)
        }
        
        try when("Set to the view controller") {
            self.viewController.movies = self.movies
        }
        
        try then("Check if collection view have the correct attributes") {
            XCTAssertEqual(self.viewController.collectionView.numberOfItems(inSection: 0), 10)
        }
    }
    
    func testIfSetupWorksWithValidFilteredDTO() throws {
        try given("A valid setup") {
            self.viewController.isSearchActive = true
            self.viewController.presenter      = self.presenter
            self.movies                        = MovieBuilder()
                                                    .build(amount: 10)
            self.filteredMovies                = MovieBuilder()
                                                    .build(amount: 3)
        }
        
        try when("Set to the view controller") {
            self.viewController.movies         = self.movies
            self.viewController.filteredMovies = self.filteredMovies
        }
        
        try then("Check if collection view have the correct attributes") {
            XCTAssertEqual(self.viewController.collectionView.numberOfItems(inSection: 0), 3)
        }
    }
    
    func testIfPickedCountryChangesInvalidatesCurrentMovieSet() throws {
        try given("A valid setup") {
            self.viewController.presenter = self.presenter
            self.movies                   = MovieBuilder()
                                                .build(amount: 10)
            self.viewController.movies    = self.movies
        }
        
        try when("Set to the view controller") {
            self.viewController.pickedCountry = "PL"
        }
        
        try then("Check if collection view have the correct attributes") {
            XCTAssertEqual(self.viewController.collectionView.numberOfItems(inSection: 0), 0)
            XCTAssertTrue(self.viewController.movies.isEmpty)
        }
    }

}
