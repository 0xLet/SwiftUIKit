//
//  ContainerView.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 5/17/20.
//

import UIKit

@available(iOS 9.0, *)
public class ContainerView: UIView {
    private weak var parentViewController: UIViewController?
    var viewController: UIViewController?
    
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

@available(iOS 9.0, *)
private extension ContainerView {
    func embedViewController() {
        guard let parent = parentViewController,
              let child = viewController else {
            return
        }
        
        parent.addChild(child)
        child.didMove(toParent: parent)
        
        embed {
            child.view
        }
    }
}
