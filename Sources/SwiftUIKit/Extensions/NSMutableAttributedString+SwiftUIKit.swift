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
    init(_ attributes: () -> [AttributedStringKey: Any]) {
        self = attributes()
    }
    
    init(for key: AttributedStringKey, value: Any) {
        self = [key: value]
    }
    
    @discardableResult
    mutating func add(key: AttributedStringKey, value: Any) -> StringAttributes {
        
        self[key] = value
        
        return self
    }
}

public extension NSMutableAttributedString {
    @discardableResult
    func set(attributes: StringAttributes, range: ClosedRange<Int>) -> Self {
        
        self.setAttributes(attributes, range: NSRange(location: range.lowerBound, length: range.upperBound))
        
        return self
    }
}
