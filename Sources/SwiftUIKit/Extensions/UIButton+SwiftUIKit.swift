//
//  UIButton+SwiftUIKit.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 7/7/20.
//

import UIKit

public extension UIButton {
    @discardableResult
    func set(titleColor: UIColor?,
             forState state: UIControl.State = .normal) -> Self {
        setTitleColor(titleColor, for: state)
        
        return self
    }
}
