//
//  Divider.swift
//  
//
//  Created by Zach Eriksen on 11/2/19.
//

import UIKit

/**
 A UIView that divides vertically or horizontally
 */
public class Divider: UIView {
    /// Creates a UIView
    /// - parameters:
    ///     - axis: Axis to divide (Default: .horizontal)
    ///     - color: Color of the divider (Default: .systemGray)
    public init(
        _ axis: NSLayoutConstraint.Axis = .horizontal,
        color: UIColor? = .systemGray
    ) {
        super.init(frame: .zero)
        
        self.backgroundColor = color
        
        if axis == .horizontal {
            frame(height: 1)
        } else {
            frame(width: 1)
        }
    }
    
    /// not implemented
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

