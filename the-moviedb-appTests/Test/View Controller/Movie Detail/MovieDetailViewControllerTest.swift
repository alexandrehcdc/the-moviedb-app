//
//  MovieDetailViewControllerTest.swift
//  the-moviedb-appTests
//
//  Created by Alexandre Henrique on 2/24/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import XCTest
import the_moviedb_app
@testable import the_moviedb_app

class MovieDetailViewControllerTest: XCTestCase {

    private var viewController: MovieDetailViewController!
    private var movieDTO: MovieDTO!
    
    override func setUp() {
        super.setUp()
        
        self.viewController = MovieDetailViewController()
        
        self.viewController.loadViewIfNeeded()
    }

    override func tearDown() {
        self.viewController = nil
        self.movieDTO       = nil
    }
    
    func testIfSetupWorksWithValidDTO() throws {
        try given("A valid setup") {
            self.movieDTO = MovieDTO(id: 1,
                                     title: "Some title",
                                     posterURL: URLBuilder.getPosterImage(path: "", imageSize: 200),
                                     page: 1,
                                     totalPages: 1,
                                     overview: "A valid overview",
                                     releaseDate: "24/02/2020",
                                     genres: ["Horror", "Comedy"])
        }
        
        try when("Set to the view controller") {
            self.viewController.movie = self.movieDTO
            self.viewController.viewDidLoad()
        }
        
        try then("Check if elements have the correct attributes") {
            XCTAssertEqual(self.viewController.titleLabel.text, self.movieDTO.title)
            XCTAssertEqual(self.viewController.genreLabel.text, self.movieDTO.genres.joined(separator: ", "))
            XCTAssertEqual(self.viewController.overviewLabel.text, self.movieDTO.overview)
            XCTAssertEqual(self.viewController.releaseDateLabel.text, self.movieDTO.releaseDate)
        }
    }
    
    func testIfSetupDoesntWorkIfNoDTOIsSet() throws {
        try given("No valid setup") {
            self.movieDTO = nil
        }
        
        try when("Load the view controller") {
            self.viewController.viewDidLoad()
        }
        
        try then("Check if elements have the correct attributes") {
            XCTAssertNil(self.viewController.titleLabel.text)
            XCTAssertNil(self.viewController.genreLabel.text)
            XCTAssertNil(self.viewController.overviewLabel.text)
            XCTAssertNil(self.viewController.releaseDateLabel.text)
        }
    }

}
