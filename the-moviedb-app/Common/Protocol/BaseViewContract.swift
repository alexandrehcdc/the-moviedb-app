//
//  BaseViewContract.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/22/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import Foundation

protocol BaseViewContract: AnyObject {
    func showLoader()
    func hideLoader()
}
