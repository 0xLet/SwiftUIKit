//
//  Spacer.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 10/29/19.
//

import UIKit

/**
 A UIView that expands unless a height or width is provided
 */
public class Spacer: UIView {
    private var height: Float?
    private var width: Float?
    
    /// Creates a UIView
    /// - parameters:
    ///     - height: Height for the Spacer, if nil the height will grow as much as possible (Default: nil)
    ///     - width: Width for the Spacer, if nil the width will grow as much as possible (Default: nil)
    public init(height: Float? = nil, width: Float? = nil) {
        self.height = height
        self.width = width
        super.init(frame: .zero)
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
        } else {
            setContentHuggingPriority(.defaultLow, for: .vertical)
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
        } else {
            setContentHuggingPriority(.defaultLow, for: .horizontal)
        }
    }
    
    /// not implemented
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
