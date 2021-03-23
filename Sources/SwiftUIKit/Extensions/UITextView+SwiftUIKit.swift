//
//  UITextView+SwiftUIKit.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 7/7/20.
//

import UIKit

public extension UITextView {
    /// Updates the textColor of the UITextView with the color provided
    @discardableResult
    func text(color: UIColor?) -> Self {
        textColor = color
        
        return self
    }
    
    /// Updates the text of the UITextView with the text value provided
    @discardableResult
    func text(_ value: String?) -> Self {
        text = value
        
        return self
    }
    
    /// Updates the tintColor of the UITextView with the color provided
    @discardableResult
    func tint(color: UIColor?) -> Self {
        tintColor = color
        
        return self
    }
    
    /// Set the UITextViewDelegate for the UITextView
    @discardableResult
    func set(delegate: UITextViewDelegate?) -> Self {
        self.delegate = delegate
        
        return self
    }
}
