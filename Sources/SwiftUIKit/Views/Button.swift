//
//  Button.swift
//  
//
//  Created by Zach Eriksen on 10/30/19.
//

import UIKit

/**
 A UIButton that handles its own action.
 */
public class Button: UIButton {
    private var action: (() -> Void)?
    
    /// Creates a UIButton
    /// - parameters:
    ///     - title: Text used for the button's title
    ///     - titleColor: Color used for the title's font (Default: nil)
    ///     - backgroundColor: Color used for the button's background color (Default: nil)
    ///     - forEvent: UIControl event for when to fire action (Default: .touchUpInside)
    ///     - action: Closure for the the button's action (Default: nil)
    public init(
        title: String,
        titleColor: UIColor? = nil,
        backgroundColor: UIColor? = nil,
        forEvent event: UIControl.Event = .touchUpInside,
        action: (() -> Void)? = nil
    ) {
        self.action = action
        super.init(frame: .zero)
        
        self.backgroundColor = backgroundColor
        self.setTitleColor(titleColor ?? .systemBlue, for: .normal)
        self.setTitle(title, for: .normal)
        self.addTarget(self, action: #selector(handleButtonTap), for: event)
        
        accessibility(label: title, traits: .button)
    }
    
    /// Creates a UIButton with a label view
    /// - parameters:
    ///     - forEvent: UIControl event for when to fire action (Default: .touchUpInside)
    ///     - action: Closure for the the button's action
    ///     - labelView: The view to embed
    public init(
        forEvent event: UIControl.Event = .touchUpInside,
        action: (() -> Void)? = nil,
        labelView: () -> UIView
    ) {
        self.action = action
        super.init(frame: .zero)
        
        embed {
            labelView()
                .gesture { UITapGestureRecognizer(target: self, action: #selector(handleButtonTap)) }
        }
        
        self.addTarget(self, action: #selector(handleButtonTap), for: event)
    }
    
    /// Update the button's action
    @discardableResult
    public func setAction(_ action: (() -> Void)?) -> Self {
        self.action = action
        
        return self
    }
    
    /// not implemented
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func handleButtonTap() {
        action?()
    }
}
