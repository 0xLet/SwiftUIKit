//
//  ZStack.swift
//  
//
//  Created by Zach Eriksen on 11/27/19.
//

import UIKit

/// ZStack:
/// A view which stacks its children views in order
@available(iOS 9.0, *)
public class ZStack: UIView {
    /// The views that the ZStack contains
    public var views: [UIView] = []
    
    /// Create a ZStack
    /// - Parameters:
    ///     - closure: A trailing closure that accepts an array of views
    public init(_ closure: () -> [UIView]) {
        views = closure()
        super.init(frame: .zero)
        
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
            $0.sizeToFit()
        }
    }
    
    /// Create a ZStack
    /// - Parameters:
    ///     - closure: A trailing closure that accepts an array of optional views
    public init(_ closure: () -> [UIView?]) {
        views = closure()
            .compactMap { $0 }
        super.init(frame: .zero)
        
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
            $0.sizeToFit()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
