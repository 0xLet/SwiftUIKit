//
//  ZStack.swift
//  
//
//  Created by Zach Eriksen on 11/27/19.
//

import UIKit

/// ZStack:
/// A view which stacks its children views in order
public class ZStack: UIView {
    /// The views that the ZStack contains
    public var views: [UIView] = []
    
    /// Create a ZStack
    /// - Parameters:
    ///     - content: A trailing closure that accepts an array of views
    public init(content: () -> [UIView]) {
        views = content()
        super.init(frame: .zero)
        
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
            $0.sizeToFit()
        }
    }
    
    /// Create a ZStack
    /// - Parameters:
    ///     - content: A trailing closure that accepts an array of optional views
    public init(content: () -> [UIView?]) {
        views = content()
            .compactMap { $0 }
        super.init(frame: .zero)
        
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
            $0.sizeToFit()
        }
    }
    
    /// not implemented
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
