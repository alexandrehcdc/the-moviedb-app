//
//  XCTestExtension.swift
//  the-moviedb-appTests
//
//  Created by Alexandre Henrique on 2/23/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import XCTest

extension XCTestCase {
    func given(_ description: String, closure: () throws -> Void) throws {
        try closure()
    }
    
    func when(_ description: String, closure: () throws -> Void) throws {
        try closure()
    }
    
    func then(_ description: String, closure: () throws -> Void) throws {
        try closure()
    }
}
