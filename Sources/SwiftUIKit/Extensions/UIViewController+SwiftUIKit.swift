//
//  UIViewController+SwiftUIKit.swift
//  
//
//  Created by Zach Eriksen on 11/4/19.
//

import UIKit

@available(iOS 9.0, *)
public extension UIViewController {
    convenience init(_ closure: (() -> UIView)) {
        self.init()
        
        view.embed(closure)
    }
    
    /// Go without the Navigation Controller using the current ViewController to present the new ViewController 
    func go(to viewController: UIViewController,
            style: Navigate.NavigationStyle,
            completion: (() -> Void)? = nil) {
        Navigate.shared.go(from: self,
                           to: viewController,
                           style: style,
                           completion: completion)
    }
    
    /// Navigate with the Navigation Controller to the new ViewController
    func navigate(_ viewController: UIViewController,
                  style: Navigate.NavigationStyle,
                  completion: (() -> Void)? = nil) {
        Navigate.shared.go(viewController,
                           style: style,
                           completion: completion)
    }
}
