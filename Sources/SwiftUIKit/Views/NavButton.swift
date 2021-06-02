//
//  NavButton.swift
//  
//
//  Created by Zach Eriksen on 11/4/19.
//

import UIKit

/**
 A UISwitch that handles its own action and navigation
 */
public class NavButton: Button {
    private var destination: () -> UIViewController
    private var style: Navigate.NavigationStyle
    
    /// Creates a UIButton
    /// - parameters:
    ///     - title: Text used for the button's title
    ///     - tapHandler: Closure for the the button's action (Default: nil)
    ///     - destination: Destination view to navigate to when tapped
    ///     - style: Navigation style for presenting the destination view
    ///     - titleColor: Color used for the title's font (Default: nil)
    ///     - backgroundColor: Color used for the button's background color (Default: nil)
    public init(
        title: String,
        tapHandler: (() -> Void)? = nil,
        destination: @escaping () -> UIViewController,
        style: Navigate.NavigationStyle,
        titleColor: UIColor? = nil,
        backgroundColor: UIColor? = nil
    ) {
        
        self.destination = destination
        self.style = style
        
        super.init(
            title: title,
            titleColor: titleColor,
            backgroundColor: backgroundColor,
            forEvent: .touchUpInside,
            action: {
                tapHandler?()
                Navigate.shared.go(destination(), style: style)
            }
        )
    }
    
    /// Creates a UIButton with a label view
    /// - parameters:
    ///     - tapHandler: Closure for the the button's action (Default: nil)
    ///     - destination: Destination view to navigate to when tapped
    ///     - style: Navigation style for presenting the destination view
    ///     - labelView: The view to embed
    public init(
        tapHandler: (() -> Void)? = nil,
        destination: @escaping () -> UIViewController,
        style: Navigate.NavigationStyle,
        labelView: () -> UIView
    ) {
        
        self.destination = destination
        self.style = style
        
        super.init(
            forEvent: .touchUpInside,
            action: {
                tapHandler?()
                Navigate.shared.go(destination(), style: style)
            },
            labelView: labelView
        )
    }
    
    /// not implemented
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
