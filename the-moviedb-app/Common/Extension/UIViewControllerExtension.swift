//
//  UIViewControllerExtension.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/22/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import UIKit

extension UIViewController {

    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        self.present(alert, animated: true)
    }
    
    func composedAlert(title: String, message: String, handlersTitles: [String]? = nil, handlers: [(((UIAlertAction) -> Void), UIAlertAction.Style)]? = nil) {
        
        guard let mappedHandlers = handlers, let mappedTitles = handlersTitles else {
            self.alert(title: title, message: message)
            return
        }
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        for (title, handler) in zip(mappedTitles, mappedHandlers) {
            alert.addAction(UIAlertAction(title: title, style: handler.1, handler: handler.0))
        }
        
        self.present(alert, animated: true)
    }
}

