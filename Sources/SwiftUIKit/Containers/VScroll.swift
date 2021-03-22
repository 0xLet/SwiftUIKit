//
//  VScroll.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 9/1/20.
//

import UIKit

/**
A view that only allows for vertical scrolling.
 */
@available(iOS 9.0, *)
public class VScroll: UIView {
    
    /// Creates a new view with a `ScrollView` embedded inside of a parent view.
    ///
    /// - Parameters:
    ///     - padding: Leading and Trailing padding of the scrollable view (Default: 0)
    ///     - closure: A closure that returns the scrollable view
    public init(
        withPadding padding: Float = 0,
        _ closure: () -> UIView
    ) {
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
    
    /// not implemented
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
