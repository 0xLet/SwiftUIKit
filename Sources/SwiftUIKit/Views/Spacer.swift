//
//  Spacer.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 10/29/19.
//

import UIKit

@available(iOS 9.0, *)
public class Spacer: UIView {
    private var height: Float?
    private var width: Float?
    
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
