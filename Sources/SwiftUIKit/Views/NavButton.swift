//
//  NavButton.swift
//  
//
//  Created by Zach Eriksen on 11/4/19.
//

import UIKit

@available(iOS 9.0, *)
public class NavButton: Button {
    private var destination: UIViewController
    private var style: Navigate.NavigationStyle
    
    public init(_ title: String,
                destination: UIViewController,
                style: Navigate.NavigationStyle,
                titleColor: UIColor = .white,
                backgroundColor: UIColor? = nil,
                _ tapHandler: (() -> Void)? = nil) {
        
        self.destination = destination
        self.style = style
        
        super.init(title,
                   titleColor: titleColor,
                   backgroundColor: backgroundColor,
                   forEvent: .touchUpInside) {
                    tapHandler?()
                    Navigate.shared.go(destination,
                                       style: style)
        }
    }
    
    public init(_ tapHandler: (() -> Void)? = nil,
                destination: UIViewController,
                style: Navigate.NavigationStyle,
                _ closure: () -> UIView) {
        
        self.destination = destination
        self.style = style
        
        super.init({
            tapHandler?()
            Navigate.shared.go(destination,
                               style: style)
        },
                   forEvent: .touchUpInside,
                   closure)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
