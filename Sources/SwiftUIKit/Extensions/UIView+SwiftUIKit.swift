//
//  UIView+SwiftUIKit.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 10/29/19.
//

import UIKit

@available(iOS 9.0, *)
public extension UIView {
    
    /// Create a UIView with an embedded view inside
    /// - Parameters:
    ///     - withPadding: The padding surrounding the embedded view (Default: 0)
    ///     - backgroundColor: The color to set as the backgroundColor of the parent view (Default: .clear)
    ///     - content: A trailing closure that accepts a view which will be embedded (Default: nil)
    convenience init(
        withPadding padding: Float = 0,
        backgroundColor: UIColor? = .clear,
        content: (() -> UIView)? = nil
    ) {
        self.init(frame: .zero)
        
        self.backgroundColor = backgroundColor
        
        guard let content = content else {
            return
        }
        
        embed(withPadding: padding, content: content)
    }
    
    /// Create a UIView with an embedded view inside
    /// - Parameters:
    ///     - withPadding: The `Padding` surrounding the embedded view
    ///     - backgroundColor: The color to set as the backgroundColor of the parent view (Default: .clear)
    ///     - content: A trailing closure that accepts a view which will be embedded (Default: nil)
    convenience init(
        leadingPadding: Float? = nil,
        topPadding: Float? = nil,
        trailingPadding: Float? = nil,
        bottomPadding: Float? = nil,
        backgroundColor: UIColor? = .clear,
        content: (() -> UIView)? = nil
    ) {
        self.init(frame: .zero)
        
        self.backgroundColor = backgroundColor
        
        guard let content = content else {
            return
        }
        
        embed(leadingPadding: leadingPadding,
              topPadding: topPadding,
              trailingPadding: trailingPadding,
              bottomPadding: bottomPadding,
              content: content)
    }
    
    /// Embed a Stack
    /// - Parameters:
    ///     - withSpacing: The amount of spacing between each child view (Default: 0)
    ///     - padding: The amount of space between this view and its parent view (Default: 0)
    ///     - alignment: The layout of arranged views perpendicular to the stack view’s axis (source: UIStackView.Alignment) (Default: .fill)
    ///     - distribution: The layout that defines the size and position of the arranged views along the stack view’s axis (source: UIStackView.Distribution) (Default: .fill)
    ///     - axis: Keys that specify a horizontal or vertical layout constraint between objects (source: NSLayoutConstraint.Axis)
    ///     - content: A trailing closure that accepts an array of views
    @discardableResult
    func stack(
        withSpacing spacing: Float = 0,
        padding: Float = 0,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        axis: NSLayoutConstraint.Axis,
        content: () -> [UIView?]
    ) -> Self {
        let viewsInVStack = content()
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
    ///     - withSpacing: The amount of spacing between each child view (Default: 0)
    ///     - padding: The amount of space between this view and its parent view
    ///     - alignment: The layout of arranged views perpendicular to the stack view’s axis (source: UIStackView.Alignment) (Default: .fill)
    ///     - distribution: The layout that defines the size and position of the arranged views along the stack view’s axis (source: UIStackView.Distribution) (Default: .fill)
    ///     - axis: Keys that specify a horizontal or vertical layout constraint between objects (source: NSLayoutConstraint.Axis)
    ///     - content: A trailing closure that accepts an array of views
    @discardableResult
    func stack(
        withSpacing spacing: Float = 0,
        leadingPadding: Float? = nil,
        topPadding: Float? = nil,
        trailingPadding: Float? = nil,
        bottomPadding: Float? = nil,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        axis: NSLayoutConstraint.Axis,
        content: () -> [UIView?]
    ) -> Self {
        let viewsInVStack = content()
            .compactMap { $0 }
        
        let stackView = UIStackView(arrangedSubviews: viewsInVStack)
        stackView.spacing = CGFloat(spacing)
        stackView.alignment = alignment
        stackView.distribution = distribution
        stackView.axis = axis
        
        embed(
            leadingPadding: leadingPadding,
            topPadding: topPadding,
            trailingPadding: trailingPadding,
            bottomPadding: bottomPadding
        ) {
            stackView
        }
        
        return self
    }
    
    /// Embed a VStack
    /// - Parameters:
    ///     - withSpacing: The amount of spacing between each child view (Default: 0)
    ///     - padding: The amount of space between this view and its parent view (Default: 0)
    ///     - alignment: The layout of arranged views perpendicular to the stack view’s axis (source: UIStackView.Alignment) (Default: .fill)
    ///     - distribution: The layout that defines the size and position of the arranged views along the stack view’s axis (source: UIStackView.Distribution) (Default: .fill)
    ///     - content: A trailing closure that accepts an array of views
    @discardableResult
    func vstack(
        withSpacing spacing: Float = 0,
        padding: Float = 0,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        content: () -> [UIView?]
    ) -> Self {
        stack(
            withSpacing: spacing,
            padding: padding,
            alignment: alignment,
            distribution: distribution,
            axis: .vertical,
            content: content
        )
    }
    
    /// Embed a VStack
    /// - Parameters:
    ///     - withSpacing: The amount of spacing between each child view (Default: 0)
    ///     - padding: The amount of space between this view and its parent view
    ///     - alignment: The layout of arranged views perpendicular to the stack view’s axis (source: UIStackView.Alignment) (Default: .fill)
    ///     - distribution: The layout that defines the size and position of the arranged views along the stack view’s axis (source: UIStackView.Distribution) (Default: .fill)
    ///     - content: A trailing closure that accepts an array of views
    @discardableResult
    func vstack(
        withSpacing spacing: Float = 0,
        leadingPadding: Float? = nil,
        topPadding: Float? = nil,
        trailingPadding: Float? = nil,
        bottomPadding: Float? = nil,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        content: () -> [UIView?]
    ) -> Self {
        stack(
            withSpacing: spacing,
            leadingPadding: leadingPadding,
            topPadding: topPadding,
            trailingPadding: trailingPadding,
            bottomPadding: bottomPadding,
            alignment: alignment,
            distribution: distribution,
            axis: .vertical,
            content: content
        )
    }
    
    /// Embed a HStack
    /// - Parameters:
    ///     - withSpacing: The amount of spacing between each child view (Default: 0)
    ///     - padding: The amount of space between this view and its parent view (Default: 0)
    ///     - alignment: The layout of arranged views perpendicular to the stack view’s axis (source: UIStackView.Alignment) (Default: .fill)
    ///     - distribution: The layout that defines the size and position of the arranged views along the stack view’s axis (source: UIStackView.Distribution) (Default: .fill)
    ///     - content: A trailing closure that accepts an array of views
    @discardableResult
    func hstack(
        withSpacing spacing: Float = 0,
        padding: Float = 0,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        content: () -> [UIView?]
    ) -> Self {
        stack(
            withSpacing: spacing,
            padding: padding,
            alignment: alignment,
            distribution: distribution,
            axis: .horizontal,
            content: content
        )
    }
    
    /// Embed a HStack
    /// - Parameters:
    ///     - withSpacing: The amount of spacing between each child view (Default: 0)
    ///     - padding: The amount of space between this view and its parent view
    ///     - alignment: The layout of arranged views perpendicular to the stack view’s axis (source: UIStackView.Alignment) (Default: .fill)
    ///     - distribution: The layout that defines the size and position of the arranged views along the stack view’s axis (source: UIStackView.Distribution) (Default: .fill)
    ///     - content: A trailing closure that accepts an array of views
    @discardableResult
    func hstack(
        withSpacing spacing: Float = 0,
        leadingPadding: Float? = nil,
        topPadding: Float? = nil,
        trailingPadding: Float? = nil,
        bottomPadding: Float? = nil,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        content: () -> [UIView?]
    ) -> Self {
        stack(withSpacing: spacing,
              leadingPadding: leadingPadding,
              topPadding: topPadding,
              trailingPadding: trailingPadding,
              bottomPadding: bottomPadding,
              alignment: alignment,
              distribution: distribution,
              axis: .horizontal,
              content: content
        )
    }
    
    /// Embed a View to all anchors (top, bottom, leading, trailing)
    /// - Parameters:
    ///     - withPadding: The amount of space between the embedded view and this view (Default: 0)
    ///     - content: A trailing closure that accepts a view
    @discardableResult
    func embed(
        withPadding padding: Float = 0,
        content: () -> UIView
    ) -> Self {
        let viewToEmbed = content()
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
    ///     - content: A trailing closure that accepts a view
    @discardableResult
    func center(content: () -> UIView) -> Self {
        let viewToEmbed = content()
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
    ///     - content: A trailing closure that accepts a view
    @discardableResult
    func embed(
        leadingPadding: Float? = nil,
        topPadding: Float? = nil,
        trailingPadding: Float? = nil,
        bottomPadding: Float? = nil,
        content: () -> UIView
    ) -> Self {
        let viewToEmbed = content()
        viewToEmbed.translatesAutoresizingMaskIntoConstraints = false
        addSubview(viewToEmbed)
        
        if let leadingPadding = leadingPadding {
            viewToEmbed.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(leadingPadding)).isActive = true
        }
        
        if let topPadding = topPadding {
            viewToEmbed.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat(topPadding)).isActive = true
        }
        
        if let trailingPadding = trailingPadding {
            viewToEmbed.trailingAnchor.constraint(equalTo: trailingAnchor, constant: CGFloat(-trailingPadding)).isActive = true
        }
        
        if let bottomPadding = bottomPadding {
            viewToEmbed.bottomAnchor.constraint(equalTo: bottomAnchor, constant: CGFloat(-bottomPadding)).isActive = true
        }
        
        return self
    }
    
    /// Sets the vertical setContentHuggingPriority
    @discardableResult
    func setVertical(huggingPriority: UILayoutPriority) -> Self {
        setContentHuggingPriority(huggingPriority, for: .vertical)
        
        return self
    }
    
    /// Sets the horizontal setContentHuggingPriority
    @discardableResult
    func setHorizontal(huggingPriority: UILayoutPriority) -> Self {
        setContentHuggingPriority(huggingPriority, for: .horizontal)
        
        return self
    }
    
    /// Sets the vertical setContentCompressionResistancePriority
    @discardableResult
    func setVertical(compressionResistance: UILayoutPriority) -> Self {
        setContentCompressionResistancePriority(compressionResistance, for: .vertical)
        
        return self
    }
    
    /// Sets the horizontal setContentCompressionResistancePriority
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
    ///     - padding: The amount of space between this view and its parent view (Default: 8)
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
    ///     - height: Value for the heightAnchor (Default: nil)
    ///     - width: Value for the widthAnchor (Default: nil)
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
    ///     - height: Value for the heightAnchor (Default: nil)
    ///     - width: Value for the widthAnchor (Default: nil)
    @available(iOS 10.0, *)
    @discardableResult
    func update(
        height: Float? = nil,
        width: Float? = nil,
        animated: Bool = false
    ) -> Self {
        guard animated else {
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
        
        Self.animate(withDuration: 1) {
            self.update(height: height, width: width)
            self.layoutIfNeeded()
        }
        
        
        return self
    }
    
    /// Update the anchor's leading padding constant value
    @available(iOS 10.0, *)
    @discardableResult
    func update(leadingPadding: Float, animated: Bool = false) -> Self {
        leadingConstraints.first?.constant = CGFloat(leadingPadding)
        
        if animated {
            Self.animate(withDuration: 1) {
                self.layoutIfNeeded()
            }
        }
        
        return self
    }
    
    /// Update the anchor's top padding constant value
    @available(iOS 10.0, *)
    @discardableResult
    func update(topPadding: Float, animated: Bool = false) -> Self {
        topConstraints.first?.constant = CGFloat(topPadding)
        
        if animated {
            Self.animate(withDuration: 1) {
                self.layoutIfNeeded()
            }
        }
        
        return self
    }
    
    /// Update the anchor's trailing padding constant value
    @available(iOS 10.0, *)
    @discardableResult
    func update(trailingPadding: Float, animated: Bool = false) -> Self {
        trailingConstraints.first?.constant = CGFloat(-trailingPadding)
        
        if animated {
            Self.animate(withDuration: 1) {
                self.layoutIfNeeded()
            }
        }
        
        return self
    }
    
    /// Update the anchor's bottom padding constant value
    @available(iOS 10.0, *)
    @discardableResult
    func update(bottomPadding: Float, animated: Bool = false) -> Self {
        bottomConstraints.first?.constant = CGFloat(-bottomPadding)
        
        if animated {
            Self.animate(withDuration: 1) {
                self.layoutIfNeeded()
            }
        }
        
        return self
    }
    
    /// Update any anchor's constant value
    @available(iOS 10.0, *)
    @discardableResult
    func update(
        leadingPadding: Float? = nil,
        topPadding: Float? = nil,
        trailingPadding: Float? = nil,
        bottomPadding: Float? = nil,
        animated: Bool = false
    ) -> Self {
        if let leadingPadding = leadingPadding {
            update(leadingPadding: leadingPadding, animated: animated)
        }
        
        if let topPadding = topPadding {
            update(topPadding: topPadding, animated: animated)
        }
        
        if let trailingPadding = trailingPadding {
            update(trailingPadding: trailingPadding, animated: animated)
        }
        
        if let bottomPadding = bottomPadding {
            update(bottomPadding: bottomPadding, animated: animated)
        }
        
        return self
    }
    
    /// Update all anchor's constant value
    @available(iOS 10.0, *)
    @discardableResult
    func update(
        padding: Float? = nil,
        animated: Bool = false
    ) -> Self {
        update(
            leadingPadding: padding,
            topPadding: padding,
            trailingPadding: padding,
            bottomPadding: padding,
            animated: animated
        )
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
    ///     - x: Value to add to the center.x (Default: nil)
    ///     - y: Value to add to the center.y (Default: nil)
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
    ///     - x: Value to set the center.x (Default: nil)
    ///     - y: Value to set the center.y (Default: nil)
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
    func center(
        xOffset: Float? = nil,
        yOffset: Float? = nil,
        in view: UIView
    ) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self)
        
        if let x = xOffset {
            centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: CGFloat(x)).isActive = true
        }
        if let y = yOffset {
            centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: CGFloat(y)).isActive = true
        }
        
        return self
    }
    
    /// Animate the current view
    /// - parameters:
    ///     - withDuration: Duration of the animation
    ///     - animation: Closure which changes to the view are animated
    ///     - completion: Closure which runs once the animation has been completed (Default: nil)
    @discardableResult
    func animate(
        withDuration duration: TimeInterval,
        animation: @escaping (UIView) -> Void,
        completion: ((UIView) -> Void)? = nil
    ) -> Self {
        
        UIView.animate(withDuration: duration,
                       animations: { animation(self) }) { (isComplete) in
            if isComplete {
                completion?(self)
            }
        }
        
        return self
    }
    
    /// Animate the current view
    /// - parameters:
    ///     - withDuration: Duration of the animation
    ///     - delay: The duration which the animation should be delayed
    ///     - otions: The UIView.AnimationOptions for the animation
    ///     - animation: Closure which changes to the view are animated
    ///     - completion: Closure which runs once the animation has been completed (Default: nil)
    @discardableResult
    func animate(
        withDuration duration: TimeInterval,
        delay: TimeInterval,
        options: UIView.AnimationOptions,
        animation: @escaping (UIView) -> Void,
        completion: ((UIView) -> Void)? = nil
    ) -> Self {
        
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: options,
                       animations: { animation(self) }) { (isComplete) in
            if isComplete {
                completion?(self)
            }
        }
        
        return self
    }
    
    /// Hide the view
    /// - Parameters:
    ///     - if: A bool that determines if the view should be hidden
    @discardableResult
    func hide(if shouldHide: Bool) -> Self {
        isHidden = shouldHide
        
        return self
    }
    
    /// Hide the view
    /// - Parameters:
    ///     - if: A closure that determines if the view should be hidden
    @discardableResult
    func hide(if shouldHide: () -> Bool) -> Self {
        isHidden = shouldHide()
        
        return self
    }
    
    /// Hide the view
    @discardableResult
    func hidden(withAnimatedDuration duration: Double = 0) -> Self {
        alpha = 1
        
        animate(withDuration: duration,
                animation: { view in
                    view.alpha = 0
                }) { view in
            view.isHidden = true
            view.alpha = 1
            
        }
        
        return self
    }
    
    /// Show the view
    @discardableResult
    func appear(withAnimatedDuration duration: Double = 0) -> Self {
        alpha = 0
        isHidden = false
        
        animate(
            withDuration: duration,
            animation: { view in
                view.alpha = 1
            }
        ) { view in
            view.isHidden = false
            view.alpha = 1
            
        }
        
        return self
    }
    
    /// Modify the transform of the view
    @discardableResult
    func transform(content: (CGAffineTransform) -> CGAffineTransform) -> Self {
        transform = content(transform)
        
        return self
    }
    
    /// Sets the accessibility values of the view
    @discardableResult
    func accessibility(
        label: String? = nil,
        identifier: String? = nil,
        traits: UIAccessibilityTraits? = nil
    ) -> Self {
        
        label.map { accessibilityLabel = $0 }
        identifier.map { accessibilityIdentifier = $0 }
        traits.map { accessibilityTraits = $0 }
        
        return self
    }
    
    /// Add a GestureRecognizer to the view
    /// - Parameters:
    ///     - content: A trailing closure that accepts a UIGestureRecognizer
    @discardableResult
    func gesture(content: () -> UIGestureRecognizer) -> Self {
        let gesture = content()
        
        addGestureRecognizer(gesture)
        
        return self
    }
    
    /// Sets the backgroundColor of the view to the color provided
    @discardableResult
    func background(color: UIColor?) -> Self {
        backgroundColor = color
        
        return self
    }
    
    /// Sets clipsToBounds to the value provided
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
    ///     - animated: Should animate setting the left UIBarButtonItem (Default: true)
    @discardableResult
    func navigateSetLeft(barButton: UIBarButtonItem?, animated: Bool = true) -> Self {
        Navigate.shared.setLeft(barButton: barButton, animated: animated)
        
        return self
    }
    
    /// Set the right barButton
    /// - Parameters:
    ///     - barButton: The UIBarButtonItem to be set
    ///     - animated: Should animate setting the right UIBarButtonItem (Default: true)
    @discardableResult
    func navigateSetRight(barButton: UIBarButtonItem?, animated: Bool = true) -> Self {
        Navigate.shared.setRight(barButton: barButton, animated: animated)
        
        return self
    }
    
    /// Set the left barButtons
    /// - Parameters:
    ///     - barButton: The [UIBarButtonItem] to be set
    ///     - animated: Should animate setting the left [UIBarButtonItem] (Default: true)
    @discardableResult
    func navigateSetLeft(barButtons: [UIBarButtonItem]?, animated: Bool = true) -> Self {
        Navigate.shared.setLeft(barButtons: barButtons, animated: animated)
        
        return self
    }
    
    /// Set the right barButtons
    /// - Parameters:
    ///     - barButton: The [UIBarButtonItem] to be set
    ///     - animated: Should animate setting the right [UIBarButtonItem] (Default: true)
    @discardableResult
    func navigateSetRight(barButtons: [UIBarButtonItem]?, animated: Bool = true) -> Self {
        Navigate.shared.setRight(barButtons: barButtons, animated: animated)
        
        return self
    }
}

public extension UIView {
    /// Returns all subviews of the current view
    var allSubviews: [UIView] {
        getSubviews(forView: self)
    }
    
    /// Useful debug function to change all subviews background color to a random color and count the number of subviews
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
    
    /// private function to get all subviews for a view
    private func getSubviews(forView view: UIView) -> [UIView] {
        var views: [UIView] = []
        for view in view.subviews {
            views.append(view)
            views.append(contentsOf: getSubviews(forView: view))
        }
        return views
    }
}

