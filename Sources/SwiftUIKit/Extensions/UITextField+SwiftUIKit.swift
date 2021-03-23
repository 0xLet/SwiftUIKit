//
//  UITextField+SwiftUIKit.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 7/7/20.
//

import UIKit

public extension UITextField {
    /// Updates the textColor of the UITextField with the color provided
    @discardableResult
    func text(color: UIColor?) -> Self {
        textColor = color
        
        return self
    }
    
    /// Updates the text of the UITextField with the text value provided
    @discardableResult
    func text(_ value: String?) -> Self {
        text = value
        
        return self
    }
}
