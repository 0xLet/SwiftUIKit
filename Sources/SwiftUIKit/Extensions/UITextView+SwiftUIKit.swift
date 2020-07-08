//
//  UITextView+SwiftUIKit.swift
//  SwiftUIKit
//
//  Created by CRi on 7/7/20.
//

import UIKit

public extension UITextView {
    @discardableResult
    func text(color: UIColor?) -> Self {
        textColor = color
        
        return self
    }
    
    @discardableResult
    func tint(color: UIColor?) -> Self {
        tintColor = color
        
        return self
    }
    
    @discardableResult
    func set(delegate: UITextViewDelegate?) -> Self {
        self.delegate = delegate
        
        return self
    }
}
