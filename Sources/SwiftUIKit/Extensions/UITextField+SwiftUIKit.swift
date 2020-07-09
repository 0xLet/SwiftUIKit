//
//  UITextField+SwiftUIKit.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 7/7/20.
//

import UIKit

public extension UITextField {
    @discardableResult
    func text(color: UIColor?) -> Self {
        textColor = color
        
        return self
    }
}
