//
//  UIBarButton+SwiftUIKit.swift
//
//
//  Created by Zach Eriksen on 10/30/19.
//

import UIKit

public typealias BarButton = UIBarButtonItem

public extension UIBarButtonItem {
    
    /// Create a UIBarButtonItem with a CustomView
    /// - Parameters:
    ///     - closure: A trailing closure that accepts a view
    convenience init(customView: () -> UIView) {
        self.init(customView: customView())
    }
}
