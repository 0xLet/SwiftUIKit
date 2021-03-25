//
//  SafeAreaView.swift
//  
//
//  Created by Zach Eriksen on 10/30/19.
//

import UIKit

/// A View that respects the SafeArea
@available(iOS 11.0, *)
public class SafeAreaView: UIView {
    
    /// Create a SafeAreaView
    /// - Parameter closure: A trailing closure that accepts a view
    public init(
        ignoreTopAnchorWithPadding topPadding: Float? = nil,
        ignoreLeadingAnchorWithPadding leadingPadding: Float? = nil,
        ignoreTrailingAnchorWithPadding trailingPadding: Float? = nil,
        ignoreBottomAnchorWithPadding bottomPadding: Float? = nil,
        _ closure: () -> UIView
    ) {
        let view = closure()
        super.init(frame: .zero)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        
        let margins = layoutMarginsGuide
        let guide = safeAreaLayoutGuide
        
        activateLayoutConstraints {
            [
                topPadding.map {
                    view.topAnchor.constraint(equalTo: topAnchor,
                                              constant: CGFloat($0))
                } ?? view.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor,
                                               multiplier: 1.0),
                
                leadingPadding.map {
                    view.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                  constant: CGFloat($0))
                } ?? view.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
                
                trailingPadding.map {
                    view.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                   constant: CGFloat(-$0))
                } ?? view.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
                
                bottomPadding.map {
                    view.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                 constant: CGFloat(-$0))
                } ?? guide.bottomAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor,
                                                   multiplier: 1.0)
            ]
        }
    }
    
    /// not implemented
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
