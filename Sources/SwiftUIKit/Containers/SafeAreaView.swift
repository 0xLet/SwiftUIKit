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
    private var topConstraint: NSLayoutConstraint = NSLayoutConstraint() {
        didSet {
            topConstraint.isActive = true
        }
    }
    private var leadingConstraint: NSLayoutConstraint = NSLayoutConstraint() {
        didSet {
            leadingConstraint.isActive = true
        }
    }
    private var trailingConstraint: NSLayoutConstraint = NSLayoutConstraint() {
        didSet {
            trailingConstraint.isActive = true
        }
    }
    private var bottomConstraint: NSLayoutConstraint = NSLayoutConstraint() {
        didSet {
            bottomConstraint.isActive = true
        }
    }
    
    private var embeddedView: UIView
    
    /// Create a SafeAreaView
    /// - Parameter closure: A trailing closure that accepts a view
    public init(_ closure: () -> UIView) {
        embeddedView = closure()
        super.init(frame: .zero)
        
        embeddedView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(embeddedView)
        
        let margins = layoutMarginsGuide
        let guide = safeAreaLayoutGuide
        
        topConstraint = embeddedView.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1.0)
        leadingConstraint =  embeddedView.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        trailingConstraint = embeddedView.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        bottomConstraint = embeddedView.bottomAnchor.constraint(equalToSystemSpacingBelow: guide.bottomAnchor, multiplier: 1.0)
    }
    
    /// not implemented
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func ignore(
        topAnchorWithPadding topPadding: CGFloat? = nil,
        leadingAnchorWithPadding leadingPadding: CGFloat? = nil,
        trailingAnchorWithPadding trailingPadding: CGFloat? = nil,
        bottomAnchorWithPadding bottomPadding: CGFloat? = nil
    ) -> Self {
        if let topPadding = topPadding {
            topConstraint.isActive = false
            
            topConstraint = embeddedView.topAnchor.constraint(equalTo: topAnchor, constant: topPadding)
        }
        
        if let leadingPadding = leadingPadding {
            leadingConstraint.isActive = false
            
            leadingConstraint = embeddedView.topAnchor.constraint(equalTo: topAnchor, constant: leadingPadding)
        }
        
        if let trailingPadding = trailingPadding {
            trailingConstraint.isActive = false
            
            trailingConstraint = embeddedView.topAnchor.constraint(equalTo: topAnchor, constant: trailingPadding)
        }
        
        if let bottomPadding = bottomPadding {
            bottomConstraint.isActive = false
            
            bottomConstraint = embeddedView.topAnchor.constraint(equalTo: topAnchor, constant: bottomPadding)
        }
        
        return self
    }
}
