//
//  UIImageView+SwiftUIKit.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 7/7/20.
//

import UIKit

public extension UIImageView {
    /// Updates the current image to be the templated image of itself
    @discardableResult
    func templateImage() -> Self {
        image = image?.template
        
        return self
    }
    
    /// Sets the tintColor for the UIImageView
    @discardableResult
    func tint(color: UIColor?) -> Self {
        tintColor = color
        
        return self
    }
}
