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
        
        public var color: UIColor {
            switch self {
            case .error:
                return .red
            case .warning:
                return .yellow
            case .success:
                return .green
            case .info:
                return .blue
            case .debug:
                return .gray
            case .custom:
                return .clear
            }
        }
    }
    
    private var navigationController: UINavigationController?
    private var toast: UIView?
    private var didTapToastHandler: ((UIView) -> Void)?
    
    public static var shared: Navigate = Navigate()
    
    // MARK: Configure NavigationController
    
    /// Configure the Navigate Singleton with the Root Navigation Controller
    @discardableResult
    public func configure(controller: UINavigationController?) -> Self {
        self.navigationController = controller
        
        return self
    }
    
    /// Set the visibleViewController's title
    /// - Parameters:
    ///     - title: The title of the currentViewController
    @discardableResult
    public func set(title: String) -> Self {
        navigationController?.visibleViewController?.title = title
        
        return self
    }
    
    /// Set the left barButton
    /// - Parameters:
    ///     - barButton: The UIBarButtonItem to be set
    ///     - animated: Should animate setting the left UIBarButtonItem
    @discardableResult
    public func setLeft(barButton: UIBarButtonItem?, animated: Bool = true) -> Self {
        navigationController?.visibleViewController?.navigationItem.setLeftBarButton(barButton, animated: animated)
        
        return self
    }
    
    /// Set the right barButton
    /// - Parameters:
    ///     - barButton: The UIBarButtonItem to be set
    ///     - animated: Should animate setting the right UIBarButtonItem
    @discardableResult
    public func setRight(barButton: UIBarButtonItem?, animated: Bool = true) -> Self {
        navigationController?.visibleViewController?.navigationItem.setRightBarButton(barButton, animated: animated)
        
        return self
    }
    
    /// Set the left barButtons
    /// - Parameters:
    ///     - barButton: The [UIBarButtonItem] to be set
    ///     - animated: Should animate setting the left [UIBarButtonItem]
    @discardableResult
    public func setLeft(barButtons: [UIBarButtonItem]?, animated: Bool = true) -> Self {
        navigationController?.visibleViewController?.navigationItem.setLeftBarButtonItems(barButtons, animated: animated)
        
        return self
    }
    
    /// Set the right barButtons
    /// - Parameters:
    ///     - barButton: The [UIBarButtonItem] to be set
    ///     - animated: Should animate setting the right [UIBarButtonItem]
    @discardableResult
    public func setRight(barButtons: [UIBarButtonItem]?, animated: Bool = true) -> Self {
        navigationController?.visibleViewController?.navigationItem.setRightBarButtonItems(barButtons, animated: animated)
        
        return self
    }
    
    // MARK: Navigation
    
    /// Go to a viewController by using the configured NavigationController
    /// - Parameters:
    ///     - viewController: UIViewController to navigate to
    ///     - style: Style of navigation
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
    
    /// Go to a viewController by using another viewController
    /// - Parameters:
    ///     - from: The UIViewController that is handling the navigation
    ///     - viewController: UIViewController to navigate to
    ///     - style: Style of navigation
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
    
    /// Navigate back and dismiss the visibleViewController
    /// - Parameters:
    ///     - toRoot: Should navigate back to the rootViewController
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
    
    /// Dismiss the visibleViewController
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
    
    /// Show an Alert
    /// - Parameters:
    ///     - title: Title of the UIAlertController
    ///     - message: Message of the UIAlertController
    ///     - withactions: Array of action objects to be added to the Alert
    ///     - secondsToPersist: Amount of seconds the Alert should show before dismissing itself
    ///     - closure: A closure that is passed the UIAlertController before presenting it
    public func alert(title: String,
                      message: String,
                      withActions actions: [UIAlertAction] = [],
                      secondsToPersist: Double?,
                      _ closure: ((UIAlertController) -> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
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
    
    /// Show an ActionSheet
    /// - Parameters:
    ///     - title: Title of the UIAlertController
    ///     - message: Message of the UIAlertController
    ///     - withactions: Array of action objects to be added to the ActionSheet
    ///     - closure: A closure that is passed the UIAlertController before presenting it
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
    
    /// Show a Toast Message
    /// - Parameters:
    ///     - style: The ToastStyle (default: .custom)
    ///     - pinToTop: Should the Toast pin to the top or bottom (default: true)
    ///     - secondsToPersist: Amount of seconds the Toast should show before dismissing itself
    ///     - animationInDuration: The amount of seconds the Toast should fade in (default: 0.5)
    ///     - animationOutDuration: The amount of seconds the Toast should fade out (default: 0.5)
    ///     - padding: The amount of spacing around the Toast
    ///     - tapHandler: What happens when the user taps on the Toast (default: { $0.removeFromSuperview() })
    ///     - closure: A trailing closure that accepts a view
    @available(iOS 11.0, *)
    public func toast(style: ToastStyle = .custom,
                      pinToTop: Bool = true,
                      secondsToPersist: Double? = nil,
                      animationInDuration: Double = 0.5,
                      animationOutDuration: Double = 0.5,
                      padding: Float = 8,
                      tapHandler: @escaping (UIView) -> Void = { $0.removeFromSuperview() },
                      _ closure: @escaping () -> UIView) {
        
        // Don't allow more than one Toast to be present
        guard toast == nil else {
            return
        }
        didTapToastHandler = tapHandler
        
        switch style {
        case .custom:
            toast = closure()
                .gesture{ UITapGestureRecognizer(target: self, action: #selector(userTappedOnToast)) }
        default:
            toast = View(backgroundColor: .clear) {
                closure()
                    .padding(8)
                    .configure {
                        $0.backgroundColor = style.color
                        $0.clipsToBounds = true
                }
                .layer { $0.cornerRadius = 8 }
                
            }
            .padding(padding)
                
            .gesture{ UITapGestureRecognizer(target: self, action: #selector(userTappedOnToast)) }
        }
        
        toast?.translatesAutoresizingMaskIntoConstraints = false
        toast?.alpha = 0
        
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
        
        let pinConstraint = pinToTop ? toast.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor) : toast.bottomAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.bottomAnchor)
        
        NSLayoutConstraint.activate(
            [
                pinConstraint,
                toast.leadingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.leadingAnchor),
                toast.trailingAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.trailingAnchor),
                toast.heightAnchor.constraint(greaterThanOrEqualToConstant: 60),
            ]
        )
        
        // Animation In
        DispatchQueue.main.async {
            toast.layoutIfNeeded()
            UIView.animate(withDuration: animationInDuration) {
                toast.alpha = 1
            }
        }
        
        // Animation Out
        if let timeToLive = secondsToPersist {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + timeToLive) {
                UIView.animate(withDuration: animationOutDuration, animations: {
                    toast.alpha = 0
                    toast.layoutIfNeeded()
                }) { didComplete in
                    if didComplete {
                        self.destroyToast()
                    }
                }
            }
        }
    }
    
    /// Destory the toast
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
