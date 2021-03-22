//
//  UIBarButton+SwiftUIKit.swift
//
//
//  Created by Zach Eriksen on 10/30/19.
//

import UIKit

/// Simple typealias for UIBarButtonItem
public typealias BarButton = UIBarButtonItem

public extension UIBarButtonItem {
    
    /// Create a UIBarButtonItem with a CustomView
    /// - Parameter closure: A trailing closure that accepts a view
    convenience init(customView: () -> UIView) {
        self.init(customView: customView())
    }
    
    /// Create a UIBarButtonItem with a UIView
    /// - Parameter view: A UIView
    convenience init(view: UIView) {
        self.init(customView: view)
    }
}
