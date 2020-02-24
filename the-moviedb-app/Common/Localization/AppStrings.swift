//
//  AppStrings.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/21/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import Foundation

struct AppStrings {

    // MARK: App description strings
    public static let appVersionNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    public static let appVersionName   = localized("app_version_name")
    public static let appVersion       = "\(appVersionName) \(String(describing: appVersionNumber))"
    public static let appName          = localized("app_name")
    
    // MARK: General strings
    public static let idiom         = localized("idiom")
    public static let cancel        = localized("cancel")
    public static let error         = localized("error")
    public static let emptyResponse = localized("empty_response")
    public static let brazil        = localized("brazil")
    public static let unitedStates  = localized("united_states")
    
    //MARK: Request related string
    public static let emptyResponseMessage = localized("empty_response_message")
    public static let errorResponseMessage = localized("error_response_message")
    
    // MARK: Configuration related strings
    public static let pickRegion      = localized("pick_region")
    public static let pickRegionTitle = localized("pick_region_title")
    public static let otherRegion     = localized("other_region")
    
    // MARK: Movie related strings
    public static let upcomingMovies = localized("upcoming_movies")
    
    // MARK: Localization function
    public static func localized(_ value: String) -> String {
        NSLocalizedString(value, tableName: nil, bundle: Bundle.main, value: String(), comment: String())
    }
    
}
