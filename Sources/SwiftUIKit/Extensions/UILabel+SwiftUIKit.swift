//
//  UILabel+SwiftUIKit.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 7/7/20.
//

import UIKit

public extension UILabel {
    @discardableResult
    func text(color: UIColor?) -> Self {
        textColor = color
        
        return self
    }
    
    @discardableResult
    func text(_ value: String?) -> Self {
        text = value
        
        return self
    }
}
