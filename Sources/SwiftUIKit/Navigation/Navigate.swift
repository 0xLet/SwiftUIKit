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
        
        didTapToastHandler = tapHandler
        toast = View { closure().padding(16) }
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
        
        controller.visibleViewController?.view.addSubview(toast)
        controller.visibleViewController?.view.bringSubviewToFront(toast)
        
        var topAnchor: NSLayoutConstraint?
        
        if #available(iOS 11.0, *) {
            topAnchor = NSLayoutConstraint(item: toast, attribute: .top, relatedBy: .equal, toItem: containerView.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0)
            NSLayoutConstraint.activate(
                [
                    toast.leadingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.leadingAnchor),
                    toast.trailingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.trailingAnchor),
                    toast.heightAnchor.constraint(greaterThanOrEqualToConstant: 60),
                    topAnchor
                    ]
                    .compactMap { $0 }
            )
        } else {
            topAnchor = NSLayoutConstraint(item: toast, attribute: .top, relatedBy: .equal, toItem: containerView, attribute: .top, multiplier: 1, constant: 0)
            NSLayoutConstraint.activate(
                [
                    toast.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                    toast.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                    toast.heightAnchor.constraint(greaterThanOrEqualToConstant: 60),
                    topAnchor
                    ]
                    .compactMap { $0 }
            )
        }
        
        DispatchQueue.main.async {
            topAnchor?.constant = toast.frame.height
            UIView.animate(withDuration: animationInDuration) {
                toast.layoutIfNeeded()
            }
        }
        
        if let timeToLive = secondsToPersist {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + timeToLive) {
                topAnchor?.constant = -toast.frame.height
                UIView.animate(withDuration: animationOutDuration) {
                    toast.layoutIfNeeded()
                }
            }
        }
    }
    
    @objc private func userTappedOnToast() {
        guard let toast = toast else {
            print("Toast \(#function) Error!")
            print("Issue trying to dismiss Toast")
            print("Error: Could not unwrap Toast")
            return
        }
        didTapToastHandler?(toast)
        self.toast = nil
        self.didTapToastHandler = nil
    }
}
