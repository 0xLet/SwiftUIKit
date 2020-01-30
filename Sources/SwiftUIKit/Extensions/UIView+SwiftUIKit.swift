//
//  UIView+SwiftUIKit.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 10/29/19.
//

import UIKit

@available(iOS 9.0, *)
public extension UIView {
    
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
    func padding(_ padding: Float = 8) -> View {
        return View(backgroundColor: backgroundColor)
            .embed(withPadding: padding) { self }
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
    
    /// Hide the view
    /// - Parameters:
    ///     - if: A closure that determines if the view should be hidden
    @discardableResult
    func hide(if shouldHide: () -> Bool) -> Self {
        isHidden = shouldHide()
        
        return self
    }
    
    /// Hide the view
    /// - Parameters:
    ///     - if: A Bool that determines if the view should be hidden
    @discardableResult
    func hide(if shouldHide: Bool) -> Self {
        isHidden = shouldHide
        
        return self
    }
    
    /// Modify the object's layer
    /// - Parameters:
    ///     - closure: A trailing closure that receives itself.layer inside the closue
    @discardableResult
    func layer(_ closure: (CALayer) -> Void) -> Self {
        closure(layer)
        
        return self
    }
    
    /// Modify the object's accessibility
    /// - Parameters:
    ///     - label: A succinct label that identifies the accessibility element, in a localized string (source: accessibilityLabel)
    ///     - identifier: A string that identifies the element (source: accessibilityIdentifier)
    ///     - traits: The combination of accessibility traits that best characterize the accessibility element (source: accessibilityTraits)
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
    func background(color: UIColor) -> Self {
        backgroundColor = color
        
        return self
    }
    
    @discardableResult
    func clipsToBounds(_ shouldClip: Bool = true) -> Self {
        self.clipsToBounds = shouldClip
        
        return self
    }
    
    @discardableResult
    func corner(radius: Float) -> Self {
        layer.cornerRadius = CGFloat(radius)
        
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
        Navigate.shared.setLeft(barButton: barButton)
        
        return self
    }
    
    /// Set the right barButton
    /// - Parameters:
    ///     - barButton: The UIBarButtonItem to be set
    ///     - animated: Should animate setting the right UIBarButtonItem
    @discardableResult
    func navigateSetRight(barButton: UIBarButtonItem?, animated: Bool = true) -> Self {
        Navigate.shared.setRight(barButton: barButton)
        
        return self
    }
    
    /// Set the left barButtons
    /// - Parameters:
    ///     - barButton: The [UIBarButtonItem] to be set
    ///     - animated: Should animate setting the left [UIBarButtonItem]
    @discardableResult
    func navigateSetLeft(barButtons: [UIBarButtonItem]?, animated: Bool = true) -> Self {
        Navigate.shared.setLeft(barButtons: barButtons)
        
        return self
    }
    
    /// Set the right barButtons
    /// - Parameters:
    ///     - barButton: The [UIBarButtonItem] to be set
    ///     - animated: Should animate setting the right [UIBarButtonItem]
    @discardableResult
    func navigateSetRight(barButtons: [UIBarButtonItem]?, animated: Bool = true) -> Self {
        Navigate.shared.setRight(barButtons: barButtons)
        
        return self
    }
}

public extension UIView {
    var allSubviews: [UIView] {
        return getSubviews(forView: self)
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

