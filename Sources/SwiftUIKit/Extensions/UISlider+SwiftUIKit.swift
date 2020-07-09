//
//  UISlider+SwiftUIKit.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 7/7/20.
//

import UIKit

public extension UISlider {
    @discardableResult
    func set(thumbImage: UIImage?,
             forState state: UIControl.State = .normal) -> Self {
        setThumbImage(thumbImage, for: state)
        
        return self
    }
    
    @discardableResult
    func tint(thumbColor: UIColor?) -> Self {
        thumbTintColor = thumbColor
        
        return self
    }
}

