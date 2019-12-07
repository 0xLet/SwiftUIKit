//
//  UIBarButton+SwiftUIKit.swift
//
//
//  Created by Zach Eriksen on 10/30/19.
//

import UIKit

public typealias BarButton = UIBarButtonItem

public extension UIBarButtonItem {
    
    convenience init(customView: () -> UIView) {
        self.init(customView: customView())
    }
}
