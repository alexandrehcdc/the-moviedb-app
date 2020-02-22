//
//  UIViewControllerExtension.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/22/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import UIKit

extension UIViewController {

    private static let activityIndicator = UIActivityIndicatorView(style: .large)

    func showActivityLoader() {
        DispatchQueue.main.async {
            UIViewController.activityIndicator.center           = self.view.center
            UIViewController.activityIndicator.color            = .darkGray
            UIViewController.activityIndicator.hidesWhenStopped = true
            
            self.view.addSubview(UIViewController.activityIndicator)
            
            self.view.window?.isUserInteractionEnabled = false
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

