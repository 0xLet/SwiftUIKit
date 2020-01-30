//
//  View.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 10/29/19.
//

import UIKit

@available(iOS 9.0, *)
public class View: UIView {
    public init(withPadding padding: Float = 0,
                backgroundColor: UIColor? = .clear,
                _ closure: (() -> UIView)? = nil) {
        super.init(frame: .zero)
        
        self.backgroundColor = backgroundColor
        
        _ = closure.map { embed(withPadding: padding, $0) }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
