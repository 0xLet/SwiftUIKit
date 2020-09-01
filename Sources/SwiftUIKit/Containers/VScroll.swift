//
//  VScroll.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 9/1/20.
//

import UIKit

@available(iOS 9.0, *)
public class VScroll: UIView {
    
    public init(withPadding padding: Float = 0,
                _ closure: () -> UIView) {
        super.init(frame: .zero)
        
        let scrollableView = closure()
        
        let scrollView = ScrollView {
            scrollableView
        }
        
        embed {
            scrollView
        }
        .configure { parentView in
            NSLayoutConstraint.activate([
                scrollableView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: CGFloat(padding)),
                scrollableView.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: CGFloat(-padding))
            ])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
