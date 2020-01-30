//
//  NSMutableAttributedString+SwiftUIKit.swift
//  
//
//  Created by Zach Eriksen on 12/11/19.
//

import Foundation

public typealias AttributedString = NSMutableAttributedString
public typealias AttributedStringKey = NSAttributedString.Key
public typealias StringAttributes = [AttributedStringKey: Any]

public extension StringAttributes {
    /// Create a dictionary with NSAttributedString.Key
    /// - Parameters:
    ///     - attributes: A trailing closure that accepts a dictionary with NSAttributedString.Key
    init(_ attributes: () -> [AttributedStringKey: Any]) {
        self = attributes()
    }
    
    /// Create a dictionary with one NSAttributedString.Key
    /// - Parameters:
    ///     - for: A NSAttributedString.Key for the String
    ///     - value: The value for the attribute being modifed
    init(for key: AttributedStringKey, value: Any) {
        self = [key: value]
    }
    
    /// Add an AttributedStringKey with a value of type Any to the dictionary
    /// - Parameters:
    ///     - key: A NSAttributedString.Key for the String
    ///     - value: The value for the attribute being modifed
    @discardableResult
    mutating func add(key: AttributedStringKey, value: Any) -> StringAttributes {
        
        self[key] = value
        
        return self
    }
}

public extension NSMutableAttributedString {
    
    /// Simple Swift wrapper for setAttributes(_ attrs: [NSAttributedString.Key : Any]?, range: NSRange)
    /// - Parameters:
    ///     - attributes: StringAttributes is a typealias for [NSAttributedString.Key : Any],
    ///     - range: Closed Int Range. Example: 0 ... 3
    @discardableResult
    func set(attributes: StringAttributes, range: ClosedRange<Int>) -> Self {
        
        self.setAttributes(attributes, range: NSRange(location: range.lowerBound, length: range.upperBound))
        
        return self
    }
}
