//
//  UIViewController+SwiftUIKit.swift
//  
//
//  Created by Zach Eriksen on 11/4/19.
//

import UIKit

/**
 A UIViewController which embeds the closure's view after the viewDidLoad
 */
public class ViewController: UIViewController {
    private var content: () -> UIView
    
    /// Creates a UIViewController which only runs the closure after the viewDidLoad
    public init(content: @escaping (() -> UIView)) {
        self.content = content
        
        super.init(nibName: nil, bundle: nil)
    }
    
    /// not implemented
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.embed(content: content)
    }
}

public extension UIViewController {
    
    /// Create a UIViewController and embed the trailing closure's view
    convenience init(content: () -> UIView) {
        self.init()
        
        view.embed(content: content)
    }
    
    /// Go without the Navigation Controller using the current ViewController to present the new ViewController 
    func go(
        to viewController: UIViewController,
        style: Navigate.NavigationStyle,
        completion: (() -> Void)? = nil
    ) {
        Navigate.shared.go(from: self,
                           to: viewController,
                           style: style,
                           completion: completion)
    }
    
    /// Navigate with the Navigation Controller to the new ViewController
    func navigate(
        _ viewController: UIViewController,
        style: Navigate.NavigationStyle,
        completion: (() -> Void)? = nil
    ) {
        Navigate.shared.go(viewController,
                           style: style,
                           completion: completion)
    }
    
    /// Create a ViewController with Safe Area
    @available(iOS 11.0, *)
    class func safe(content: () -> UIView) -> UIViewController {
        UIViewController {
            SafeAreaView(content: content)
        }
    }
}
