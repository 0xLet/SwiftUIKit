//
//  UIImage+SwiftUIKit.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 7/7/20.
//

import UIKit

public extension UIImage {
    var template: UIImage {
        guard renderingMode != .alwaysTemplate else {
            return self
        }
        
        return withRenderingMode(.alwaysTemplate)
    }
}
