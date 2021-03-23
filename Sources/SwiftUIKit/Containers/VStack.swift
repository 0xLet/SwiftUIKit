//
//  VStack.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 10/29/19.
//

import UIKit

/// Vertical StackView
@available(iOS 9.0, *)
public class VStack: UIView {
    private var spacing: Float
    private var padding: Float
    private var alignment: UIStackView.Alignment
    private var distribution: UIStackView.Distribution
    /// The views that the VStack contains
    private(set) public var views = [UIView]()
    
    /// Create a VStack
    /// - Parameters:
    ///     - withSpacing: The amount of spacing between each child view (Default: 0)
    ///     - padding: The amount of space between this view and its parent view (Default: 0)
    ///     - alignment: The layout of arranged views perpendicular to the stack view’s axis (source: UIStackView.Alignment) (Default: .fill)
    ///     - distribution: The layout that defines the size and position of the arranged views along the stack view’s axis (source: UIStackView.Distribution) (Default: .fill)
    ///     - closure: A trailing closure that accepts an array of views
    public init(
        withSpacing spacing: Float = 0,
        padding: Float = 0,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        _ closure: () -> [UIView]
    ) {
        self.spacing = spacing
        self.padding = padding
        self.alignment = alignment
        self.distribution = distribution
        super.init(frame: .zero)
        views = closure()
        draw(views: views)
    }
    
    /// Create a VStack that accepts an array of UIView?
    /// - Parameters:
    ///     - withSpacing: The amount of spacing between each child view (Default: 0)
    ///     - padding: The amount of space between this view and its parent view (Default: 0)
    ///     - alignment: The layout of arranged views perpendicular to the stack view’s axis (source: UIStackView.Alignment) (Default: .fill)
    ///     - distribution: The layout that defines the size and position of the arranged views along the stack view’s axis (source: UIStackView.Distribution) (Default: .fill)
    ///     - closure: A trailing closure that accepts an array of optional views
    public init(
        withSpacing spacing: Float = 0,
        padding: Float = 0,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        _ closure: () -> [UIView?]
    ) {
        self.spacing = spacing
        self.padding = padding
        self.alignment = alignment
        self.distribution = distribution
        super.init(frame: .zero)
        views = closure()
            .compactMap { $0 }
        draw(views: views)
    }
    
    /// not implemented
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// internal function to redraw hstack
    internal func draw(views: [UIView]) {
        clear()
            .vstack(withSpacing: spacing,
                    padding: padding,
                    alignment: alignment,
                    distribution: distribution)
                { views }
    }
    
    /// Update the HStack with new views
    @discardableResult
    public func update(views closure: (inout [UIView]) -> Void) -> Self {
        closure(&views)
        draw(views: views)
        
        return self
    }
}
