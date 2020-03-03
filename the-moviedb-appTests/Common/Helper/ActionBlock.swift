//
//  ActionBlock.swift
//  the-moviedb-appTests
//
//  Created by Alexandre Henrique on 2/23/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import Foundation

struct ActionBlock {
    let block: () -> ()
    
    func call() {
        block()
    }
}

func execute(action: ActionBlock, _ setup: () -> () ) {
    setup()
    action.block()
}
