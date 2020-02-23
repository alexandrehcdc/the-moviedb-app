//
//  StringExtension.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/23/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import Foundation

extension StringProtocol {
    func firstCapitalized() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
}
