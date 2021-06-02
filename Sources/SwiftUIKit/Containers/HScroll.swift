//
//  HScroll.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 9/1/20.
//

import UIKit

/**
A view that only allows for horizontal scrolling.
 */
@available(iOS 9.0, *)
public class HScroll: UIView {
    
    /// Creates a new view with a `ScrollView` embedded inside of a parent view.
    ///
    /// - Parameters:
    ///     - padding: Top and Bottom padding of the scrollable view (Default: 0)
    ///     - content: A closure that returns the scrollable view
    public init(
        withPadding padding: Float = 0,
        content: () -> UIView
    ) {
        super.init(frame: .zero)
        
        let scrollableView = content()
        
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
    
    /// not implemented
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
