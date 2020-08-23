//
//  DividerView.swift
//  
//
//  Created by Zach Eriksen on 11/2/19.
//

import UIKit

@available(iOS 9.0, *)
public class DividerView: UIView {
    public init(_ axis: NSLayoutConstraint.Axis = .horizontal,
                color: UIColor? = .systemGray) {
        super.init(frame: .zero)
        
        self.backgroundColor = color
        
        if axis == .horizontal {
            frame(height: 1)
        } else {
            frame(width: 1)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

