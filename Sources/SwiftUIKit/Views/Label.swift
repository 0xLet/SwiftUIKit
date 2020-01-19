//
//  Label.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 10/29/19.
//

import UIKit

@available(iOS 9.0, *)
public class Label: UILabel {
    
    public init(_ text: String) {
        super.init(frame: .zero)
        
        self.text = text
        
        if #available(iOS 10.0, *) {
            adjustsFontForContentSizeCategory = true
        }
        accessibility(label: text, traits: .staticText)
    }
    
    public init(_ attributedText: AttributedString) {
        super.init(frame: .zero)
        
        self.attributedText = attributedText
        
        if #available(iOS 10.0, *) {
            adjustsFontForContentSizeCategory = true
        }
        accessibility(label: attributedText.mutableString.description, traits: .staticText)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @discardableResult
    public func number(ofLines lines: Int) -> Self {
        numberOfLines = lines
        
        return self
    }
    
    @discardableResult
    public func font(_ font: UIFont) -> Self {
        self.font = font
        
        return self
    }
    
    @discardableResult
    public func font(_ textStyle: UIFont.TextStyle) -> Self {
        return self.font(UIFont.preferredFont(forTextStyle: textStyle))
    }
    
    @discardableResult
    public func hideIfBlank() -> Self {
        isHidden = text?.isEmpty ?? true
        
        return self
    }
    
    @discardableResult
    public func apply(attributes: StringAttributes) -> Self {
        attributedText = AttributedString(string: text ?? "", attributes: attributes)
        
        return self
    }
    
    @discardableResult
    public func apply(attributes: StringAttributes, range: ClosedRange<Int>) -> Self {
        attributedText = AttributedString(attributedString: attributedText ?? AttributedString(string: text ?? ""))
            .set(attributes: attributes, range: range)
        
        return self
    }
    
    @discardableResult
    public func text(alignment: NSTextAlignment) -> Self {
        textAlignment = alignment
        
        return self
    }
    
    @discardableResult
    public func text(color: UIColor) -> Self {
        textColor = color
        
        return self
    }
}

@available(iOS 9.0, *)
public extension Label {
    class func title1(_ text: String) -> Label {
        return Label(text)
            .font(.title1)
    }
    
    class func title2(_ text: String) -> Label {
        return Label(text)
            .font(.title2)
    }
    
    class func title3(_ text: String) -> Label {
        return Label(text)
            .font(.title3)
    }
    
    class func headline(_ text: String) -> Label {
        return Label(text)
            .font(.headline)
    }
    
    class func subheadline(_ text: String) -> Label {
        return Label(text)
            .font(.subheadline)
    }
    
    class func body(_ text: String) -> Label {
        return Label(text)
            .font(.body)
    }
    
    class func callout(_ text: String) -> Label {
        return Label(text)
            .font(.callout)
    }
    
    class func caption1(_ text: String) -> Label {
        return Label(text)
            .font(.caption1)
    }
    
    class func caption2(_ text: String) -> Label {
        return Label(text)
            .font(.caption2)
    }
}
