//
//  UIControl+SwiftUIKit.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 7/7/20.
//

import UIKit

public extension UIControl {
    /// Set `isEnabled` for the view
    @discardableResult
    func enabled(if value: Bool = true) -> Self {
        isEnabled = value
        
        return self
    }
    
    /// Set `isEnabled` to `true` for the view
    @discardableResult
    func enable() -> Self {
        enabled(if: true)
    }
    
    /// Set `isEnabled` to `false` for the view
    @discardableResult
    func disable() -> Self {
        enabled(if: false)
    }
    
    @discardableResult
    func tint(color: UIColor?) -> Self {
        tintColor = color
        
        return self
    }
}
