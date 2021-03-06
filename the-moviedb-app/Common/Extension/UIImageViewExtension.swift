//
//  UIImageViewExtension.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/22/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func showImageWith(path url: URL?, defaultImage: UIImage = UIImage()) {

        DispatchQueue.global(qos: .background).async {
            let imageViewImage = self.getImageViewImage(url, defaultImage: defaultImage)
            
            DispatchQueue.main.sync {
                
                UIView.transition(with: self,
                                  duration: 0.6, options: .transitionCrossDissolve,
                                  animations: {
                                    self.image = imageViewImage
                })
                
            }
        }
    }
    
    private func getImageViewImage(_ url: URL?, defaultImage: UIImage) -> UIImage {
        
        guard let url = url, let data = NSData(contentsOf: url) else { return  defaultImage }

        return UIImage(data: data as Data) ?? defaultImage
    }
    
}
