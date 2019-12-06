//
//  Label.swift
//  SwiftUIKit-Example
//
//  Created by Zach Eriksen on 10/29/19.
//  Copyright © 2019 oneleif. All rights reserved.
//

import UIKit

@available(iOS 9.0, *)
public class Label: UILabel {
    private var shouldHideIfBlank: Bool = false
    
    public override var text: String? {
        didSet {
            if shouldHideIfBlank {
                isHidden = text?.isEmpty ?? true
            }
        }
    }
    
    public init(_ text: String) {
        super.init(frame: .zero)
        
        self.text = text
        
        if #available(iOS 10.0, *) {
            adjustsFontForContentSizeCategory = true
        }
        accessibility(label: text, traits: .staticText)
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
        shouldHideIfBlank = true
        
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
