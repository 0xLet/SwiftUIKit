//
//  NSObjectProtocol+SwiftUIKit.swift
//  
//
//  Created by Zach Eriksen on 10/30/19.
//

import Foundation

public extension NSObjectProtocol {
    
    /// Modify the object
    /// - Parameters:
    ///     - closure: A trailing closure that receives itself inside the closue
    @discardableResult
    func configure(_ closure: (Self) -> Void) -> Self {
        closure(self)
        
        return self
    }
}
