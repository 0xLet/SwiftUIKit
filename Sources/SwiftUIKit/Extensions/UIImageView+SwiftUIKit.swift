//
//  UIImageView+SwiftUIKit.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 7/7/20.
//

import UIKit

public extension UIImageView {
    @discardableResult
    func templateImage() -> Self {
        image = image?.template
        
        return self
    }
    
    @discardableResult
    func tint(color: UIColor?) -> Self {
        tintColor = color
        
        return self
    }
}
