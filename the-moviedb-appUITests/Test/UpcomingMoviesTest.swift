//
//  UpcomingMoviesTest.swift
//  the-moviedb-appUITests
//
//  Created by Alexandre Henrique on 2/24/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import XCTest
@testable import The_MovieDB_App

class UpcomingMoviesTest: XCTestCase {

    private var application: XCUIApplication!
    private var navBar: XCUIElement!
    private var searchButton: XCUIElement!
    private var searchField: XCUIElement!
    private var usaRegionCell: XCUIElement!
    private var braRegionCell: XCUIElement!
    private var locationButton: XCUIElement!
    private var alert: XCUIElement!
    private var searchedCell: XCUIElement!
    private var otherCell: XCUIElement!
    
    override func setUp() {
        
        continueAfterFailure = false
        self.application     = XCUIApplication()
        
        self.application.launchEnvironment = ["TESTING":"YES"]
        
        self.application.launch()
    }

    override func tearDown() {
        self.application.terminate()
        
        self.navBar         = nil
        self.application    = nil
        self.searchButton   = nil
        self.searchField    = nil
        self.usaRegionCell  = nil
        self.braRegionCell  = nil
        self.locationButton = nil
        self.alert          = nil
        self.searchedCell   = nil
        self.otherCell      = nil
    }
    
    func testVerifyUpcomingMoviesViewElements() throws {
        try given("The mapped elements") {
            self.navBar = self.application.navigationBars["Upcoming Movies"]
        }
        
        try then("It should contain the view elements") {
            XCTAssertTrue(self.navBar.exists)
            XCTAssertTrue(self.navBar.buttons["Search"].exists)
            XCTAssertTrue(self.application.buttons["locationButton"].exists)
            XCTAssertTrue(self.application.collectionViews.element.exists)
        }
    }

    func testSearchMovieByTitle() throws {
        try given("The mapped elements") {
            self.navBar       = self.application.navigationBars["Upcoming Movies"]
            self.searchButton = navBar.buttons["Search"]
            self.searchField  = navBar.children(matching: .searchField).element
            let collectionViewCells = self.application.collectionViews.cells
            self.searchedCell = collectionViewCells.containing(.staticText, identifier: "Dolittle").element
            self.otherCell    = collectionViewCells.containing(.staticText, identifier: "Ip Man 4: The Finale").element
        }
        
        try when("Executing the actions on the screen") {
            searchButton.tap()
            searchField.tap()
            
            searchField.typeText("Dolittle")
            sleep(2)
        }
        
        try then("The right elements should be appearing on screen") {
            XCTAssertTrue(searchedCell.isHittable)
            XCTAssertFalse(otherCell.exists)
        }
    }
    
    func testRegionSelection() throws {
        try given("The mapped elements") {
            let collectionViewCells = self.application.collectionViews.cells
            self.usaRegionCell      = collectionViewCells.containing(.staticText, identifier: "Dolittle").element
            self.braRegionCell      = collectionViewCells.containing(.staticText, identifier: "The Invisible Man").element
            self.locationButton = self.application.buttons["locationButton"]
            self.alert          = self.application.alerts["Pick a region"]
        }
        
        try when("Checking previous state and executing the actions on the screen") {
            XCTAssertTrue(usaRegionCell.exists)
            
            locationButton.tap()
            
            alert.buttons["Brazil"].tap()
            sleep(2)
        }
        
        try then("The movies loaded from Brazil location should be appearing on screen") {
            XCTAssertTrue(braRegionCell.isHittable)
            XCTAssertFalse(usaRegionCell.exists)
        }
            
        
    }

}
