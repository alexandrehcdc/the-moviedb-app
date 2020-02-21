//
//  UIViewExtension.swift
//  the-moviedb-app
//
//  Created by Alexandre Henrique on 2/20/20.
//  Copyright © 2020 Alexandre Henrique. All rights reserved.
//

import UIKit

extension UIView {
    func removeSubviews() {
        self.subviews.forEach { $0.removeFromSuperview() }
    }
    
    func addSubviews(_ views: UIView...) {
        for view in views { self.addSubview(view) }
    }
    
    func setBorder(color: CGColor = UIColor.black.cgColor, width: CGFloat = 1.0) {
        self.layer.borderColor = color
        self.layer.borderWidth = width
    }
    
    func transformToRounded(radii: CGFloat? = nil) {
        self.layer.cornerRadius  = radii ?? self.frame.width / 2
        self.layer.masksToBounds = true
        self.contentMode         = .scaleAspectFill
    }
    
}

// MARK: Constraint-anchor layout extension
extension UIView {
    
    func fillSuperView() {
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
    }
    
    func anchorCenterX(anchorX: NSLayoutXAxisAnchor) {
        centerXAnchor.constraint(equalTo: anchorX).isActive = true
    }
    
    func anchorCenterY(anchorY: NSLayoutYAxisAnchor) {
        centerYAnchor.constraint(equalTo: anchorY).isActive = true
    }
    
    func anchor(top: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func anchorSize(to view: UIView) {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func anchorHeight(to view: UIView) {
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func anchorWidth(to view: UIView) {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
    
}
