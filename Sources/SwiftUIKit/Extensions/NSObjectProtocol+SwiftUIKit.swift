//
//  NSObjectProtocol+SwiftUIKit.swift
//  
//
//  Created by Zach Eriksen on 10/30/19.
//

import Foundation

public extension NSObjectProtocol {
    func configure(_ closure: (Self) -> Void) -> Self {
        closure(self)
        
        return self
    }
}
