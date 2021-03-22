//
//  UIButton+SwiftUIKit.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 7/7/20.
//

import UIKit

public extension UIButton {
    /// Set the titleColor for a UIControl State
    /// - Parameters:
    ///     - titleColor: A color for the title
    ///     - forState: The UIControl State for the titleColor
    @discardableResult
    func set(
        titleColor: UIColor?,
        forState state: UIControl.State = .normal
    ) -> Self {
        setTitleColor(titleColor, for: state)
        
        return self
    }
}
