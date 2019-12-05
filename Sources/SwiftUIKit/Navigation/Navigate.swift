//
//  Navigate.swift
//  
//
//  Created by Zach Eriksen on 11/4/19.
//

import UIKit

@available(iOS 9.0, *)
public class Navigate {
    public enum NavigationStyle {
        case push
        case modal
    }
    
    public enum ToastStyle {
        case error
        case warning
        case success
        case info
        case debug
        case custom
    }
    
    private var navigationController: UINavigationController?
    private var toast: UIView?
    private var didTapToastHandler: ((UIView) -> Void)?
    
    public static var shared: Navigate = Navigate()
    
    // MARK: Configure NavigationController
    
    @discardableResult
    public func configure(controller: UINavigationController?) -> Self {
        self.navigationController = controller
        
        return self
    }
    
    @discardableResult
    public func set(title: String) -> Self {
        navigationController?.visibleViewController?.title = title
        
        return self
    }
    
    @discardableResult
    public func setLeft(barButton: UIBarButtonItem?, animated: Bool = true) -> Self {
        navigationController?.visibleViewController?.navigationItem.setLeftBarButton(barButton, animated: animated)
        
        return self
    }
    
    @discardableResult
    public func setRight(barButton: UIBarButtonItem?, animated: Bool = true) -> Self {
        navigationController?.visibleViewController?.navigationItem.setRightBarButton(barButton, animated: animated)
        
        return self
    }
    
    @discardableResult
    public func setLeft(barButtons: [UIBarButtonItem]?, animated: Bool = true) -> Self {
        navigationController?.visibleViewController?.navigationItem.setLeftBarButtonItems(barButtons, animated: animated)
        
        return self
    }
    
    @discardableResult
    public func setRight(barButtons: [UIBarButtonItem]?, animated: Bool = true) -> Self {
        navigationController?.visibleViewController?.navigationItem.setRightBarButtonItems(barButtons, animated: animated)
        
        return self
    }
    
    // MARK: Navigation
    
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
        
        dismiss()
        
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
        
        if let presentingVC = controller.visibleViewController {
            presentingVC.dismiss(animated: true)
        }
    }
    
    // MARK: Alert
    
    public func alert(title: String,
                      message: String,
                      withActions actions: [UIAlertAction] = [],
                      secondsToPersist: Double?,
                      _ closure: ((UIAlertController) -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message:message, preferredStyle: .alert)
        
        actions.forEach { alert.addAction($0) }
        
        closure?(alert)
        
        if let timeToLive = secondsToPersist {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + timeToLive) {
                if alert.isFirstResponder {
                    alert.dismiss(animated: true)
                }
            }
        }
        
        go(alert, style: .modal)
    }
    
    // MARK: ActionSheet
    
    public func actionSheet(title: String,
                            message: String,
                            withActions actions: [UIAlertAction] = [],
                            _ closure: ((UIAlertController) -> Void)? = nil) {
        
        let actionSheet = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        actions.forEach { actionSheet.addAction($0) }
        
        closure?(actionSheet)
        
        go(actionSheet, style: .modal)
    }
    
    // MARK: Toasts & Messages
    @available(iOS 11.0, *)
    public func toast(style: ToastStyle = .custom,
                      secondsToPersist: Double? = nil,
                      animationInDuration: Double = 1,
                      animationOutDuration: Double = 1,
                      tapHandler: @escaping (UIView) -> Void = { $0.removeFromSuperview() },
                      _ closure: @escaping () -> UIView) {
        
        // Don't allow more than one Toast to be present
        guard toast == nil else {
            return
        }
        let toastCustomView = closure()
        toastCustomView.translatesAutoresizingMaskIntoConstraints = false
        didTapToastHandler = tapHandler
        toast = View { toastCustomView.padding(16) }
            .gesture{ UITapGestureRecognizer(target: self, action: #selector(userTappedOnToast)) }
        toast?.translatesAutoresizingMaskIntoConstraints = false
        
        guard let controller = navigationController,
            let containerView = controller.visibleViewController?.view,
            let toast = toast else {
                print("Navigate \(#function) Error!")
                print("Issue trying to dismiss presentingViewController")
                print("Error: Could not unwrap navigationController")
                return
        }
        // Testing... 
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        controller.visibleViewController?.view.addSubview(toast)
        controller.visibleViewController?.view.bringSubviewToFront(toast)
        
        let leadingAnchor = NSLayoutConstraint(item: toast, attribute: .leading, relatedBy: .equal, toItem: containerView.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 0)
        let trailingAnchor = NSLayoutConstraint(item: toast, attribute: .trailing, relatedBy: .equal, toItem: containerView.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: 0)
        
            NSLayoutConstraint.activate(
                [
                    toast.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor),
                    toast.heightAnchor.constraint(greaterThanOrEqualToConstant: 60),
                    leadingAnchor,
                    trailingAnchor,
                    ]
            )
        
        // Load Init View
        DispatchQueue.main.async {
            trailingAnchor.constant = containerView.frame.width
            leadingAnchor.constant = -containerView.frame.width
            
            toast.layoutIfNeeded()
        }
        
        // Animation In
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
        
            trailingAnchor.constant = 0
            leadingAnchor.constant = 0
            
            UIView.animate(withDuration: animationInDuration) {
                toast.layoutIfNeeded()
            }
        }
        
        // Animation Out
        if let timeToLive = secondsToPersist {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + timeToLive) {
                trailingAnchor.constant = -containerView.frame.width
                leadingAnchor.constant = containerView.frame.width
                UIView.animate(withDuration: animationOutDuration, animations: {
                    toast.layoutIfNeeded()
                }) { didComplete in
                    if didComplete {
                        self.destroyToast()
                    } else {
                        print("Some else completed this animation")
                    }
                }
            }
        }
    }
    
    public func destroyToast() {
        toast?.removeFromSuperview()
        toast = nil
        didTapToastHandler = nil
    }
    
    @objc private func userTappedOnToast() {
        guard let toast = toast else {
            print("Toast \(#function) Error!")
            print("Issue trying to dismiss Toast")
            print("Error: Could not unwrap Toast")
            return
        }
        didTapToastHandler?(toast)
        destroyToast()
    }
}
