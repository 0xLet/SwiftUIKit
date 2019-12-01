//
//  Navigate.swift
//  
//
//  Created by Zach Eriksen on 11/4/19.
//

import UIKit

public class Navigate {
    public enum NavigationStyle {
        case push
        case modal
    }
    
    private var navigationController: UINavigationController?
    
    public static var shared: Navigate = {
        return Navigate()
    }()
    
    @discardableResult
    public func configure(controller: UINavigationController?) -> Self {
        self.navigationController = controller
        
        return self
    }
    
    public func go(_ viewController: UIViewController,
                   style: NavigationStyle,
                   completion: (() -> Void)? = nil) {
        
        guard let controller = navigationController else {
            print("Navigate \(#function) Error!")
            print("Issue trying to navigate to \(viewController)")
            print("Error: Could not unwrap navigationController")
            return
        }
        
        switch style {
        case .push:
            controller.show(viewController, sender: self)
        case .modal:
            controller.present(viewController, animated: true, completion: completion)
        }
    }
    
    public func go(from: UIViewController,
                   to: UIViewController,
                   style: NavigationStyle,
                   completion: (() -> Void)? = nil) {
        
        switch style {
        case .push:
            from.show(to, sender: self)
        case .modal:
            from.present(to, animated: true, completion: completion)
        }
    }
    
    public func back(toRoot: Bool = false) {
        guard let controller = navigationController else {
            print("Navigate \(#function) Error!")
            print("Issue trying to navigate back")
            print("Error: Could not unwrap navigationController")
            return
        }
        
        if let presentingVC = controller.presentingViewController {
            presentingVC.dismiss(animated: true)
        }
        
        if toRoot {
            controller.popToRootViewController(animated: true)
        }
        
        controller.popViewController(animated: true)
    }
    
    public func dismiss() {
        guard let controller = navigationController else {
            print("Navigate \(#function) Error!")
            print("Issue trying to dismiss presentingViewController")
            print("Error: Could not unwrap navigationController")
            return
        }
        
        if let presentingVC = controller.presentingViewController {
            presentingVC.dismiss(animated: true)
        }
    }
    
    public func alert(title: String) {
        
        let alert = UIAlertController(title: title, message: "Soemthing", preferredStyle: .alert)
        
        go(alert, style: .modal)
    }
    
    public func actionSheet(title: String) {
        
        let actionSheet = UIAlertController(title: title, message: "Soemthing", preferredStyle: .actionSheet)
        
        go(actionSheet, style: .modal)
    }
}
