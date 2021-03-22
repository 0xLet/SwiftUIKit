//
//  UILabel+SwiftUIKit.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 7/7/20.
//

import UIKit

public extension UILabel {
    /// Sets the textColor for the UILabel with the provided color
    @discardableResult
    func text(color: UIColor?) -> Self {
        textColor = color
        
        return self
    }
    
    /// Sets the text for the UILabel with the provided text value
    @discardableResult
    func text(_ value: String?) -> Self {
        text = value
        
        return self
    }
}
