//
//  UIViewControllerExtension.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/22/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import UIKit

extension UIViewController {

    private static let activityIndicator = { () -> UIActivityIndicatorView in
        let indicator = UIActivityIndicatorView(style: .large)
        
        indicator.color            = .systemGray
        indicator.hidesWhenStopped = true
        
        return indicator
    }()

    func showActivityLoader() {
        DispatchQueue.main.async {
            UIViewController.activityIndicator.center  = self.view.center
            self.view.window?.isUserInteractionEnabled = false
            
            self.view.addSubview(UIViewController.activityIndicator)
            
            UIViewController.activityIndicator.startAnimating()
        }
    }

    func hideActivityLoader() {
        DispatchQueue.main.async {
            UIViewController.activityIndicator.removeFromSuperview()
            self.view.window?.isUserInteractionEnabled = true
        }
    }

    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        self.present(alert, animated: true)
    }
}

