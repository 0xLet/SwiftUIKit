//
//  UIView+SwiftUIKit.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 10/29/19.
//  Copyright © 2019 oneleif. All rights reserved.
//

import UIKit

@available(iOS 9.0, *)
public extension UIView {
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
    
    @discardableResult
    func clear() -> Self {
        subviews.forEach { $0.removeFromSuperview() }
        
        return self
    }
    
    @discardableResult
    func padding(_ padding: Float = 8) -> View {
        return View(backgroundColor: backgroundColor)
            .embed(withPadding: padding) { self }
            .accessibility(label: accessibilityLabel,
                           identifier: accessibilityIdentifier,
                           traits: accessibilityTraits)
    }
    
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
    
    
    @discardableResult
    func layer(_ closure: (CALayer) -> Void) -> Self {
        closure(layer)
        
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
    
    @discardableResult
    func gesture(_ closure: () -> UIGestureRecognizer) -> Self {
        let gesture = closure()
        
        addGestureRecognizer(gesture)
        
        return self
    }
}

@available(iOS 9.0, *)
public extension UIView {
    @discardableResult
    func navigateConfigure(controller: UINavigationController?) -> Self {
        Navigate.shared.configure(controller: controller)
        
        return self
    }
    
    @discardableResult
    func navigateSet(title: String) -> Self {
        Navigate.shared.set(title: title)
        
        return self
    }
    
    @discardableResult
    func navigateSetLeft(barButton: UIBarButtonItem?, animated: Bool = true) -> Self {
        Navigate.shared.setLeft(barButton: barButton)
        
        return self
    }
    
    @discardableResult
    func navigateSetRight(barButton: UIBarButtonItem?, animated: Bool = true) -> Self {
        Navigate.shared.setRight(barButton: barButton)
        
        return self
    }
    
    @discardableResult
    func navigateSetLeft(barButtons: [UIBarButtonItem]?, animated: Bool = true) -> Self {
        Navigate.shared.setLeft(barButtons: barButtons)
        
        return self
    }
    
    @discardableResult
    func navigateSetRight(barButtons: [UIBarButtonItem]?, animated: Bool = true) -> Self {
        Navigate.shared.setRight(barButtons: barButtons)
        
        return self
    }
}

public extension UIView {
    @discardableResult
    func debug() -> Self {
        var randomColor: UIColor {
            return UIColor(red: CGFloat.random(in: 0 ... 255) / 255,
                           green: CGFloat.random(in: 0 ... 255) / 255,
                           blue: CGFloat.random(in: 0 ... 255) / 255,
                           alpha: 1)
        }
        func getSubViews(forView view: UIView) -> [UIView] {
            var views: [UIView] = []
            for view in view.subviews {
                views.append(view)
                views.append(contentsOf: getSubViews(forView: view))
            }
            return views
        }
        let subviews = getSubViews(forView: self)
        
        print("DEBUG LOG:")
        print("Root Debug View: \(self)")
        print("Number of Views: \(subviews.count + 1)")
        
        subviews.forEach {
            $0.backgroundColor = randomColor
        }
        
        return self
    }
}

