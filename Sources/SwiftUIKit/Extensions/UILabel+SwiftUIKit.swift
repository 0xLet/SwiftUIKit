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
    
    /// Sets the numberOfLines for the UILabel with the value provided
    @discardableResult
    func number(ofLines lines: Int) -> Self {
        numberOfLines = lines
        
        return self
    }
    
    /// Sets the font for the UILabel with the font provided
    @discardableResult
    func font(_ font: UIFont) -> Self {
        self.font = font
        
        return self
    }
    
    /// Sets the font for the UILabel with the preferredFont for the textStyle provided
    @discardableResult
    func font(_ textStyle: UIFont.TextStyle) -> Self {
        return self.font(UIFont.preferredFont(forTextStyle: textStyle))
    }
    
    /// Sets isHidden to true if text is empty and false otherwise
    @discardableResult
    func hideIfBlank() -> Self {
        isHidden = text?.isEmpty ?? true
        
        return self
    }
    
    /// Set the attributedText to the attributes privided
    @discardableResult
    func apply(attributes: StringAttributes) -> Self {
        attributedText = AttributedString(string: text ?? "", attributes: attributes)
        
        return self
    }
    
    // Set the attributedText to the attributes privided
    @discardableResult
    func apply(attributes: StringAttributes, range: ClosedRange<Int>) -> Self {
        attributedText = AttributedString(attributedString: attributedText ?? AttributedString(string: text ?? ""))
            .set(attributes: attributes, range: range)
        
        return self
    }
    
    /// Sets the textAlignment for the UILabel with the alignment provided
    @discardableResult
    func text(alignment: NSTextAlignment) -> Self {
        textAlignment = alignment
        
        return self
    }
    
    /// Sets the textColor for the UILabel with the color provided
    @discardableResult
    func text(color: UIColor) -> Self {
        textColor = color
        
        return self
    }
}
