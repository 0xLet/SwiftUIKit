//
//  Label.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 10/29/19.
//

import UIKit

/**
 A UILabel that embeds a view
 */
@available(iOS 9.0, *)
public class Label: UILabel {
    /// Creates a UILabel
    /// - parameter text: The text for the UILabel
    public init(_ text: String) {
        super.init(frame: .zero)
        
        self.text = text
        
        if #available(iOS 10.0, *) {
            adjustsFontForContentSizeCategory = true
        }
        accessibility(label: text, traits: .staticText)
    }
    
    /// Creates a UILabel
    /// - parameter attributedText: The attributedText for the UILabel
    public init(_ attributedText: AttributedString) {
        super.init(frame: .zero)
        
        self.attributedText = attributedText
        
        if #available(iOS 10.0, *) {
            adjustsFontForContentSizeCategory = true
        }
        accessibility(label: attributedText.mutableString.description, traits: .staticText)
    }
    
    /// not implemented
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@available(iOS 9.0, *)
public extension Label {
    /// Creates a UILabel with the font of .title1
    class func title1(_ text: String) -> Label {
        Label(text).font(.title1)
    }
    
    /// Creates a UILabel with the font of .title2
    class func title2(_ text: String) -> Label {
        Label(text).font(.title2)
    }
    
    /// Creates a UILabel with the font of .title3
    class func title3(_ text: String) -> Label {
        Label(text).font(.title3)
    }
    
    /// Creates a UILabel with the font of .headline
    class func headline(_ text: String) -> Label {
        Label(text).font(.headline)
    }
    
    /// Creates a UILabel with the font of .subheadline
    class func subheadline(_ text: String) -> Label {
        Label(text).font(.subheadline)
    }
    
    /// Creates a UILabel with the font of .body
    class func body(_ text: String) -> Label {
        Label(text).font(.body)
    }
    
    /// Creates a UILabel with the font of .callout
    class func callout(_ text: String) -> Label {
        Label(text).font(.callout)
    }
    
    /// Creates a UILabel with the font of .caption1
    class func caption1(_ text: String) -> Label {
        Label(text).font(.caption1)
    }
    
    /// Creates a UILabel with the font of .caption2
    class func caption2(_ text: String) -> Label {
        Label(text).font(.caption2)
    }
}
