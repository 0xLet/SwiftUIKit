//
//  NavButton.swift
//  
//
//  Created by Zach Eriksen on 11/4/19.
//

import UIKit

@available(iOS 9.0, *)
public class NavButton: Button {
    private var destination: () -> UIViewController
    private var style: Navigate.NavigationStyle
    
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
