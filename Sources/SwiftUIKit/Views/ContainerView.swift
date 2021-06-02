//
//  ContainerView.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 5/17/20.
//

import UIKit

/**
 A UIView that contains a child UIViewController
 */
public class ContainerView: UIView {
    private weak var parentViewController: UIViewController?
    /// The embedded child UIViewController
    public var viewController: UIViewController
    
    deinit {
        viewController.willMove(toParent: nil)
        viewController.removeFromParent()
        viewController.view.removeFromSuperview()
    }
    
    /// Creates a UIView
    /// - parameters:
    ///     - parent: The parent UIViewController of the view
    ///     - child: The UIViewController to embed
    public init(
        parent: UIViewController,
        child: () -> UIViewController
    ) {
        parentViewController = parent
        viewController = child()
        super.init(frame: .zero)
        
        embedViewController()
    }
    
    /// not implemented
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension ContainerView {
    func embedViewController() {
        guard let parent = parentViewController else {
            return
        }
        
        parent.addChild(viewController)
        viewController.didMove(toParent: parent)
        
        embed {
            viewController.view
        }
    }
}
