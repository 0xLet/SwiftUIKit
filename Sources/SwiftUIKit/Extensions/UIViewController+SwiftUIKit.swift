//
//  UIViewController+SwiftUIKit.swift
//  
//
//  Created by Zach Eriksen on 11/4/19.
//

import UIKit

public class ViewController: UIViewController {
    private var closure: () -> UIView
    
    public init(_ closure: @escaping (() -> UIView)) {
        self.closure = closure
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.embed(closure)
    }
}

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
    
    @available(iOS 11.0, *)
    /// Create a ViewController with Safe Area
    class func safe(_ closure: (() -> UIView)) -> UIViewController {
        return UIViewController {
            SafeAreaView(closure)
        }
    }
}
