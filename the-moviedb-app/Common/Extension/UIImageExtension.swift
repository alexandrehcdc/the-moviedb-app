//
//  UIImageExtension.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/22/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import UIKit

extension UIImage {
    
    //MARK: Application Icons
    static public var unavailable200x300 = UIImage(named: "unavailable200x300") ?? UIImage()
    static public var expand             = UIImage(named: "expand") ?? UIImage()
    static public var marker             = UIImage(named: "marker") ?? UIImage()
    
}

extension UIImage {
    func scaled(size: CGSize) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        self.draw(in: CGRect(x: 0,
                             y: 0,
                             width: size.width,
                             height: size.height))
        
        let newImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return newImage ?? self
    }
}

