//
//  NSLayoutConstraint+SwiftUIKit.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 5/17/20.
//

import UIKit

@available(iOS 10.0, *)
public extension NSLayoutConstraint {
    
    /// Check if the `constraint` is connected to the `anchor`
    func isConnected<T>(toAnchor anchor: NSLayoutAnchor<T>) -> Bool {
        firstAnchor == anchor || secondAnchor == anchor
    }
}

@available(iOS 10.0, *)
public extension UIView {
    
    /// The leading constraints held by the view
    var leadingConstraints: [NSLayoutConstraint] {
        constraints.filter { (constraint) -> Bool in
            constraint.isConnected(toAnchor: leadingAnchor)
        }
    }
    
    /// The trailing constraints held by the view
    var trailingConstraints: [NSLayoutConstraint] {
        constraints.filter { (constraint) -> Bool in
            constraint.isConnected(toAnchor: trailingAnchor)
        }
    }
    
    /// The top constraints held by the view
    var topConstraints: [NSLayoutConstraint] {
        constraints.filter { (constraint) -> Bool in
            constraint.isConnected(toAnchor: topAnchor)
        }
    }
    
    /// The bottom constraints held by the view
    var bottomConstraints: [NSLayoutConstraint] {
        constraints.filter { (constraint) -> Bool in
            constraint.isConnected(toAnchor: bottomAnchor)
        }
    }
    
    /// The height constraints held by the view
    var heightConstraints: [NSLayoutConstraint] {
        constraints.filter { (constraint) -> Bool in
            constraint.isConnected(toAnchor: heightAnchor)
        }
    }
    
    /// The width constraints held by the view
    var widthConstraints: [NSLayoutConstraint] {
        constraints.filter { (constraint) -> Bool in
            constraint.isConnected(toAnchor: widthAnchor)
        }
    }
}
