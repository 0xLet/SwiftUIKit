//
//  UIView+SwiftUIKit.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 10/29/19.
//

import UIKit

public enum Padding {
    case leading(Float)
    case trailing(Float)
    case top(Float)
    case bottom(Float)
}

@available(iOS 9.0, *)
public extension UIView {
    
    convenience init(withPadding padding: Float = 0,
                     backgroundColor: UIColor? = .clear,
                     _ closure: (() -> UIView)? = nil) {
        self.init(frame: .zero)
        
        self.backgroundColor = backgroundColor
        
        _ = closure.map { embed(withPadding: padding, $0) }
    }
    
    convenience init(withPadding padding: [Padding],
                     backgroundColor: UIColor? = .clear,
                     _ closure: (() -> UIView)? = nil) {
        self.init(frame: .zero)
        
        self.backgroundColor = backgroundColor
        
        _ = closure.map { embed(withPadding: padding, $0) }
    }
    
    /// Embed a Stack
    /// - Parameters:
    ///     - withSpacing: The amount of spacing between each child view
    ///     - padding: The amount of space between this view and its parent view
    ///     - alignment: The layout of arranged views perpendicular to the stack view’s axis (source: UIStackView.Alignment)
    ///     - distribution: The layout that defines the size and position of the arranged views along the stack view’s axis (source: UIStackView.Distribution)
    ///     - axis: Keys that specify a horizontal or vertical layout constraint between objects (source: NSLayoutConstraint.Axis)
    ///     - closure: A trailing closure that accepts an array of views
    @discardableResult
    func stack(withSpacing spacing: Float = 0,
               padding: Float = 0,
               alignment: UIStackView.Alignment = .fill,
               distribution: UIStackView.Distribution = .fill,
               axis: NSLayoutConstraint.Axis,
               _ closure: () -> [UIView?]) -> Self {
        let viewsInVStack = closure()
            .compactMap { $0 }
        
        let stackView = UIStackView(arrangedSubviews: viewsInVStack)
        stackView.spacing = CGFloat(spacing)
        stackView.alignment = alignment
        stackView.distribution = distribution
        stackView.axis = axis
        
        embed(withPadding: padding) {
            stackView
        }
        
        return self
    }
    
    /// Embed a Stack
    /// - Parameters:
    ///     - withSpacing: The amount of spacing between each child view
    ///     - padding: The amount of space between this view and its parent view
    ///     - alignment: The layout of arranged views perpendicular to the stack view’s axis (source: UIStackView.Alignment)
    ///     - distribution: The layout that defines the size and position of the arranged views along the stack view’s axis (source: UIStackView.Distribution)
    ///     - axis: Keys that specify a horizontal or vertical layout constraint between objects (source: NSLayoutConstraint.Axis)
    ///     - closure: A trailing closure that accepts an array of views
    @discardableResult
    func stack(withSpacing spacing: Float = 0,
               padding: [Padding],
               alignment: UIStackView.Alignment = .fill,
               distribution: UIStackView.Distribution = .fill,
               axis: NSLayoutConstraint.Axis,
               _ closure: () -> [UIView?]) -> Self {
        let viewsInVStack = closure()
            .compactMap { $0 }
        
        let stackView = UIStackView(arrangedSubviews: viewsInVStack)
        stackView.spacing = CGFloat(spacing)
        stackView.alignment = alignment
        stackView.distribution = distribution
        stackView.axis = axis
        
        embed(withPadding: padding) {
            stackView
        }
        
        return self
    }
    
    /// Embed a VStack
    /// - Parameters:
    ///     - withSpacing: The amount of spacing between each child view
    ///     - padding: The amount of space between this view and its parent view
    ///     - alignment: The layout of arranged views perpendicular to the stack view’s axis (source: UIStackView.Alignment)
    ///     - distribution: The layout that defines the size and position of the arranged views along the stack view’s axis (source: UIStackView.Distribution)
    ///     - closure: A trailing closure that accepts an array of views
    @discardableResult
    func vstack(withSpacing spacing: Float = 0,
                padding: Float = 0,
                alignment: UIStackView.Alignment = .fill,
                distribution: UIStackView.Distribution = .fill,
                _ closure: () -> [UIView?]) -> Self {
        return stack(withSpacing: spacing,
                     padding: padding,
                     alignment: alignment,
                     distribution: distribution,
                     axis: .vertical,
                     closure)
    }
    
    /// Embed a VStack
    /// - Parameters:
    ///     - withSpacing: The amount of spacing between each child view
    ///     - padding: The amount of space between this view and its parent view
    ///     - alignment: The layout of arranged views perpendicular to the stack view’s axis (source: UIStackView.Alignment)
    ///     - distribution: The layout that defines the size and position of the arranged views along the stack view’s axis (source: UIStackView.Distribution)
    ///     - closure: A trailing closure that accepts an array of views
    @discardableResult
    func vstack(withSpacing spacing: Float = 0,
                padding: [Padding],
                alignment: UIStackView.Alignment = .fill,
                distribution: UIStackView.Distribution = .fill,
                _ closure: () -> [UIView?]) -> Self {
        return stack(withSpacing: spacing,
                     padding: padding,
                     alignment: alignment,
                     distribution: distribution,
                     axis: .vertical,
                     closure)
    }
    
    /// Embed a HStack
    /// - Parameters:
    ///     - withSpacing: The amount of spacing between each child view
    ///     - padding: The amount of space between this view and its parent view
    ///     - alignment: The layout of arranged views perpendicular to the stack view’s axis (source: UIStackView.Alignment)
    ///     - distribution: The layout that defines the size and position of the arranged views along the stack view’s axis (source: UIStackView.Distribution)
    ///     - closure: A trailing closure that accepts an array of views
    @discardableResult
    func hstack(withSpacing spacing: Float = 0,
                padding: Float = 0,
                alignment: UIStackView.Alignment = .fill,
                distribution: UIStackView.Distribution = .fill,
                _ closure: () -> [UIView?]) -> Self {
        return stack(withSpacing: spacing,
                     padding: padding,
                     alignment: alignment,
                     distribution: distribution,
                     axis: .horizontal,
                     closure)
    }
    
    /// Embed a HStack
    /// - Parameters:
    ///     - withSpacing: The amount of spacing between each child view
    ///     - padding: The amount of space between this view and its parent view
    ///     - alignment: The layout of arranged views perpendicular to the stack view’s axis (source: UIStackView.Alignment)
    ///     - distribution: The layout that defines the size and position of the arranged views along the stack view’s axis (source: UIStackView.Distribution)
    ///     - closure: A trailing closure that accepts an array of views
    @discardableResult
    func hstack(withSpacing spacing: Float = 0,
                padding: [Padding],
                alignment: UIStackView.Alignment = .fill,
                distribution: UIStackView.Distribution = .fill,
                _ closure: () -> [UIView?]) -> Self {
        return stack(withSpacing: spacing,
                     padding: padding,
                     alignment: alignment,
                     distribution: distribution,
                     axis: .horizontal,
                     closure)
    }
    
    /// Embed a View to all anchors (top, bottom, leading, trailing)
    /// - Parameters:
    ///     - withPadding: The amount of space between the embedded view and this view
    ///     - closure: A trailing closure that accepts a view
    @discardableResult
    func embed(withPadding padding: Float = 0,
               _ closure: () -> UIView) -> Self {
        let viewToEmbed = closure()
        viewToEmbed.translatesAutoresizingMaskIntoConstraints = false
        addSubview(viewToEmbed)
        
        NSLayoutConstraint.activate([
            viewToEmbed.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat(padding)),
            viewToEmbed.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat(-padding)),
            viewToEmbed.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(padding)),
            viewToEmbed.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat(-padding))
        ])
        
        return self
    }
    
    /// Center a View
    /// - Parameters:
    ///     - closure: A trailing closure that accepts a view
    @discardableResult
    func center(_ closure: () -> UIView) -> Self {
        let viewToEmbed = closure()
        viewToEmbed.translatesAutoresizingMaskIntoConstraints = false
        addSubview(viewToEmbed)
        
        NSLayoutConstraint.activate([
            viewToEmbed.centerXAnchor.constraint(equalTo: centerXAnchor),
            viewToEmbed.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        return self
    }
    
    /// Embed a View to certain anchors (top, bottom, leading, trailing)
    /// - Parameters:
    ///     - withPadding: The amount of space between the embedded view and this view
    ///     - closure: A trailing closure that accepts a view
    @discardableResult
    func embed(withPadding padding: [Padding],
               _ closure: () -> UIView) -> Self {
        let viewToEmbed = closure()
        viewToEmbed.translatesAutoresizingMaskIntoConstraints = false
        addSubview(viewToEmbed)
        
        NSLayoutConstraint.activate(
            padding.map {
                switch $0 {
                case .leading(let constant):
                    return viewToEmbed.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(constant))
                case .trailing(let constant):
                    return viewToEmbed.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat(-constant))
                case .top(let constant):
                    return viewToEmbed.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat(constant))
                case .bottom(let constant):
                    return viewToEmbed.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat(-constant))
                }
            }
        )
        
        return self
    }
    
    @discardableResult
    func setVertical(huggingPriority: UILayoutPriority) -> Self {
        setContentHuggingPriority(huggingPriority, for: .vertical)
        
        return self
    }
    
    @discardableResult
    func setHorizontal(huggingPriority: UILayoutPriority) -> Self {
        setContentHuggingPriority(huggingPriority, for: .horizontal)
        
        return self
    }
    
    @discardableResult
    func setVertical(compressionResistance: UILayoutPriority) -> Self {
        setContentCompressionResistancePriority(compressionResistance, for: .vertical)
        
        return self
    }
    
    @discardableResult
    func setHorizontal(compressionResistance: UILayoutPriority) -> Self {
        setContentCompressionResistancePriority(compressionResistance, for: .horizontal)
        
        return self
    }
    
    /// Clear all subviews from this view
    @discardableResult
    func clear() -> Self {
        subviews.forEach { $0.removeFromSuperview() }
        
        return self
    }
    
    /// Embed this view inside another with some padding
    /// - Parameters:
    ///     - padding: The amount of space between this view and its parent view
    @discardableResult
    func padding(_ padding: Float = 8) -> UIView {
        return UIView(withPadding: padding,
                      backgroundColor: backgroundColor) { self }
            .accessibility(label: accessibilityLabel,
                           identifier: accessibilityIdentifier,
                           traits: accessibilityTraits)
    }
    
    /// Set the height and width anchors to constant values (if nil it will not update the constraint)
    /// - Parameters:
    ///     - height: Value for the heightAnchor
    ///     - width: Value for the widthAnchor
    @discardableResult
    func frame(height: Float? = nil, width: Float? = nil) -> Self {
        if let height = height {
            heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
        }
        
        return self
    }
    
    /// Update the height and width anchors to constant values (if nil it will not update the constraint)
    /// - Parameters:
    ///     - height: Value for the heightAnchor
    ///     - width: Value for the widthAnchor
    @available(iOS 10.0, *)
    @discardableResult
    func update(height: Float? = nil, width: Float? = nil) -> Self {
        if let height = height {
            constraints.first { (constraint) -> Bool in
                constraint.firstAnchor == heightAnchor
            }?.constant = CGFloat(height)
        }
        
        if let width = width {
            constraints.first { (constraint) -> Bool in
                constraint.firstAnchor == widthAnchor
            }?.constant = CGFloat(width)
        }
        
        return self
    }
    
    /// Update a padding anchor's constant value
    @available(iOS 10.0, *)
    @discardableResult
    func update(padding: Padding) -> Self {
        switch padding {
        case .top(let value):
            topConstraints.first?.constant = CGFloat(value)
        case .bottom(let value):
            bottomConstraints.first?.constant = CGFloat(-value)
        case .leading(let value):
            leadingConstraints.first?.constant = CGFloat(value)
        case .trailing(let value):
            trailingConstraints.first?.constant = CGFloat(-value)
        }
        
        return self
    }
    
    /// Update an array of padding anchors' constant values
    @available(iOS 10.0, *)
    @discardableResult
    func update(padding: [Padding]) -> Self {
        padding.forEach { update(padding: $0) }
        
        return self
    }
    
    /// Update all padding anchors' constant value
    @available(iOS 10.0, *)
    @discardableResult
    func update(padding: Float) -> Self {
        update(padding: [
            .top(padding),
            .bottom(padding),
            .leading(padding),
            .trailing(padding)
        ])
        
        return self
    }
    
    
    /// Remove the height anchor constraint
    @available(iOS 10.0, *)
    @discardableResult
    func removeHeightConstraint() -> Self {
        if let heightConstraint = constraints.first(where: { $0.firstAnchor == heightAnchor }) {
            removeConstraint(heightConstraint)
        }
        
        return self
    }
    
    /// Remove the width anchor constraint
    @available(iOS 10.0, *)
    @discardableResult
    func removeWidthConstraint() -> Self {
        if let widthConstraint = constraints.first(where: { $0.firstAnchor == widthAnchor }) {
            removeConstraint(widthConstraint)
        }
        
        return self
    }
    
    /// Activate LayoutConstraints
    /// - Parameters:
    ///     - constraints: A trailing closure that accepts an array of NSLayoutConstraint
    @discardableResult
    func activateLayoutConstraints(_ constraints: () -> [NSLayoutConstraint]) -> Self {
        NSLayoutConstraint.activate(constraints())
        
        return self
    }
    
    /// Offset the View's center by (x, y)
    /// - Parameters:
    ///     - x: Value to add to the center.x
    ///     - y: Value to add to the center.y
    @discardableResult
    func offset(x: Float? = nil, y: Float? = nil) -> Self {
        if let x = x {
            center.x += CGFloat(x)
        }
        if let y = y {
            center.y += CGFloat(y)
        }
        
        return self
    }
    
    /// Set the View's center to (x, y)
    /// - Parameters:
    ///     - x: Value to set the center.x
    ///     - y: Value to set the center.y
    @discardableResult
    func center(x: Float? = nil, y: Float? = nil) -> Self {
        if let x = x {
            center.x = CGFloat(x)
        }
        if let y = y {
            center.y = CGFloat(y)
        }
        
        return self
    }
    
    /// Constrains the View's centerAnchors
    @discardableResult
    func center(xOffset: Float? = nil, yOffset: Float? = nil, in view: UIView) -> Self {
        if let x = xOffset {
            centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: CGFloat(x)).isActive = true
        }
        if let y = yOffset {
            centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: CGFloat(y)).isActive = true
        }
        
        return self
    }
    
    /// Hide the view
    /// - Parameters:
    ///     - if: A closure that determines if the view should be hidden
    @discardableResult
    func hide(if shouldHide: @autoclosure () -> Bool) -> Self {
        isHidden = shouldHide()
        
        return self
    }
    
    /// Hide the view
    @discardableResult
    func hidden(withAnimatedDuration duration: Double? = nil) -> Self {
        guard let duration = duration else {
            isHidden = true
            
            return self
        }
        
        alpha = 1
        
        UIView.animate(withDuration: duration,
                       animations: {
                        self.alpha = 0
                       },
                       completion: { (isCompleted) in
                        if isCompleted {
                            self.isHidden = true
                            self.alpha = 1
                        }
                       })
        
        return self
    }
    
    /// Show the view
    @discardableResult
    func appear(withAnimatedDuration duration: Double? = nil) -> Self {
        guard let duration = duration else {
            isHidden = false
            
            return self
        }
        
        alpha = 0
        isHidden = false
        
        UIView.animate(withDuration: duration,
                       animations: {
                        self.alpha = 1
                       },
                       completion: { (isCompleted) in
                        if isCompleted {
                            self.isHidden = false
                            self.alpha = 1
                        }
                       })
        
        return self
    }
    
    @discardableResult
    func accessibility(label: String? = nil,
                       identifier: String? = nil,
                       traits: UIAccessibilityTraits? = nil) -> Self {
        
        label.map { accessibilityLabel = $0 }
        identifier.map { accessibilityIdentifier = $0 }
        traits.map { accessibilityTraits = $0 }
        
        return self
    }
    
    /// Add a GestureRecognizer to the view
    /// - Parameters:
    ///     - closure: A trailing closure that accepts a UIGestureRecognizer
    @discardableResult
    func gesture(_ closure: () -> UIGestureRecognizer) -> Self {
        let gesture = closure()
        
        addGestureRecognizer(gesture)
        
        return self
    }
    
    @discardableResult
    func background(color: UIColor?) -> Self {
        backgroundColor = color
        
        return self
    }
    
    @discardableResult
    func clipsToBounds(_ shouldClip: Bool = true) -> Self {
        self.clipsToBounds = shouldClip
        
        return self
    }
}

@available(iOS 9.0, *)
public extension UIView {
    
    /// Configure the Navigate Singleton with the Root Navigation Controller
    @discardableResult
    func navigateConfigure(controller: UINavigationController?) -> Self {
        Navigate.shared.configure(controller: controller)
        
        return self
    }
    
    /// Set the visibleViewController's title
    /// - Parameters:
    ///     - title: The title of the currentViewController
    @discardableResult
    func navigateSet(title: String) -> Self {
        Navigate.shared.set(title: title)
        
        return self
    }
    
    /// Set the left barButton
    /// - Parameters:
    ///     - barButton: The UIBarButtonItem to be set
    ///     - animated: Should animate setting the left UIBarButtonItem
    @discardableResult
    func navigateSetLeft(barButton: UIBarButtonItem?, animated: Bool = true) -> Self {
        Navigate.shared.setLeft(barButton: barButton, animated: animated)
        
        return self
    }
    
    /// Set the right barButton
    /// - Parameters:
    ///     - barButton: The UIBarButtonItem to be set
    ///     - animated: Should animate setting the right UIBarButtonItem
    @discardableResult
    func navigateSetRight(barButton: UIBarButtonItem?, animated: Bool = true) -> Self {
        Navigate.shared.setRight(barButton: barButton, animated: animated)
        
        return self
    }
    
    /// Set the left barButtons
    /// - Parameters:
    ///     - barButton: The [UIBarButtonItem] to be set
    ///     - animated: Should animate setting the left [UIBarButtonItem]
    @discardableResult
    func navigateSetLeft(barButtons: [UIBarButtonItem]?, animated: Bool = true) -> Self {
        Navigate.shared.setLeft(barButtons: barButtons, animated: animated)
        
        return self
    }
    
    /// Set the right barButtons
    /// - Parameters:
    ///     - barButton: The [UIBarButtonItem] to be set
    ///     - animated: Should animate setting the right [UIBarButtonItem]
    @discardableResult
    func navigateSetRight(barButtons: [UIBarButtonItem]?, animated: Bool = true) -> Self {
        Navigate.shared.setRight(barButtons: barButtons, animated: animated)
        
        return self
    }
}

public extension UIView {
    var allSubviews: [UIView] {
        getSubviews(forView: self)
    }
    
    @discardableResult
    func debug() -> Self {
        var randomColor: UIColor {
            return UIColor(red: CGFloat.random(in: 0 ... 255) / 255,
                           green: CGFloat.random(in: 0 ... 255) / 255,
                           blue: CGFloat.random(in: 0 ... 255) / 255,
                           alpha: 1)
        }
        
        let subviews = allSubviews
        
        print("DEBUG LOG:")
        print("Root Debug View: \(self)")
        print("Number of Views: \(subviews.count + 1)")
        
        subviews.forEach {
            $0.backgroundColor = randomColor
        }
        
        return self
    }
    
    private func getSubviews(forView view: UIView) -> [UIView] {
        var views: [UIView] = []
        for view in view.subviews {
            views.append(view)
            views.append(contentsOf: getSubviews(forView: view))
        }
        return views
    }
}

