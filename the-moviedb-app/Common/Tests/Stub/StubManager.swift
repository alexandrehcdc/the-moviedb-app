//
//  StubManager.swift
//  the-moviedb-appTests
//
//  Created by Alexandre Henrique on 2/23/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import OHHTTPStubs

class StubManager {
    
    private static let rootFolder             = "Files/"
    private static let upcomingMoviesFilePath = "UpcomingMovies"
    private static let countriesFilePath      = "Countries"
    private static let posterImageFilePath    = "Poster"
    private static let genreFilePath          = "Genres"
    private static let jsonType               = "json"
    private static let jpgType                = "jpg"
    
    private static let defaultHealders = ["content-type": "application/json;charset=utf-8"]
    
    static func setUp() {
        
        // MARK: Upcoming movies stub
        OHHTTPStubs.stubRequests(passingTest: { (urlRequest) -> Bool in
            urlRequest.url == URLBuilder.grantUpcomingMoviesURL(page: 1, region: "US")
        }) { (url) -> OHHTTPStubsResponse in
            OHHTTPStubsResponse(fileAtPath: OHPathForFile("\(upcomingMoviesFilePath).\(jsonType)", self)!,
                                statusCode: 200,
                                headers: defaultHealders)
        }
        
        OHHTTPStubs.stubRequests(passingTest: { (urlRequest) -> Bool in
            urlRequest.url == URLBuilder.grantUpcomingMoviesURL(page: 1, region: "BR")
        }) { (url) -> OHHTTPStubsResponse in
            OHHTTPStubsResponse(fileAtPath: OHPathForFile("\(upcomingMoviesFilePath)BR.\(jsonType)", self)!,
                                statusCode: 200,
                                headers: defaultHealders)
        }
        
        // MARK: Countries stub
        OHHTTPStubs.stubRequests(passingTest: { (urlRequest) -> Bool in
            urlRequest.url == URLBuilder.getCountriesURL()
        }) { (url) -> OHHTTPStubsResponse in //
            OHHTTPStubsResponse(fileAtPath: OHPathForFile("\(countriesFilePath).\(jsonType)", self)!,
                                statusCode: 200,
                                headers: defaultHealders)
        }
        
        // MARK: Poster image stub
        OHHTTPStubs.stubRequests(passingTest: { (urlRequest) -> Bool in
            urlRequest.url == URLBuilder.getPosterImage(path: "", imageSize: 200)
        }) { (url) -> OHHTTPStubsResponse in
            OHHTTPStubsResponse(fileAtPath: OHPathForFile("\(posterImageFilePath).\(jpgType)", self)!,
                                statusCode: 200,
                                headers: defaultHealders)
        }
        
        // MARK: Genres stub
        OHHTTPStubs.stubRequests(passingTest: { (urlRequest) -> Bool in
            urlRequest.url == URLBuilder.getGenreURL()
        }) { (url) -> OHHTTPStubsResponse in
            OHHTTPStubsResponse(fileAtPath: OHPathForFile("\(genreFilePath).\(jsonType)", self)!,
                                statusCode: 200,
                                headers: defaultHealders)
        }
    }
    
    static func removeStubs() {
        OHHTTPStubs.removeAllStubs()
    }
}
