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
    private var completionHandler: (() -> Void)?
    
    public init(_ title: String,
                destination: UIViewController,
                style: Navigate.NavigationStyle,
                titleColor: UIColor = .white,
                backgroundColor: UIColor? = nil,
                forEvent event: UIControl.Event = .touchUpInside,
                _ completionHandler: (() -> Void)? = nil) {
        self.destination = destination
        self.style = style
        self.completionHandler = completionHandler
        super.init(title,
                   titleColor: titleColor,
                   backgroundColor: backgroundColor,
                   forEvent: event) {
                    Navigate.shared.go(destination,
                                       style: style,
                                       completion: completionHandler)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
