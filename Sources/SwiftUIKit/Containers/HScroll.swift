//
//  HScroll.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 9/1/20.
//

import UIKit

@available(iOS 9.0, *)
public class HScroll: UIView {
    
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
                scrollableView.topAnchor.constraint(equalTo: parentView.topAnchor, constant: CGFloat(padding)),
                scrollableView.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: CGFloat(-padding))
            ])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
