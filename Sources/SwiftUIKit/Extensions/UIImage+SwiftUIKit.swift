//
//  UIImage+SwiftUIKit.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 7/7/20.
//

import UIKit

public extension UIImage {
    /// Updates the renderingMode to be .alwaysTemplate
    var template: UIImage {
        guard renderingMode != .alwaysTemplate else {
            return self
        }
        
        return withRenderingMode(.alwaysTemplate)
    }
}
