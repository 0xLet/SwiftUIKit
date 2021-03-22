//
//  UIView+Chain.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 8/26/20.
//

import E
import UIKit
import Chain

@available(iOS 9.0, *)
private extension UIView {
    /// Create a UIView using a chain of events with a centeredLoadingView or an embeddedLoadingView
    /// - parameters:
    ///     - link: A Chain of events that must be completed for the view to be shown
    ///     - update: A closure to handle updating the view when the chain is completed
    ///     - shouldBackground: Decides if the chain should be started in the background
    ///     - centeredLoadingView: A centered view to show while the chain is running
    ///     - embeddedLoadingView: An embedded view to show while the chain is running
    static func chain(
        link: Chain,
        update: @escaping (UIView) -> Void,
        shouldBackground: Bool = false,
        centeredLoadingView: UIView? = nil,
        embeddedLoadingView: UIView? = nil
    ) -> UIView {
        let view = UIView()
        
        if let embeddedLoadingView = embeddedLoadingView {
            view.embed {
                embeddedLoadingView
            }
        } else {
            view.center {
                centeredLoadingView ?? LoadingView().start()
            }
        }
        
        let chainEnd: Chain = .complete(
            .void {
                update(view)
            }
        )
        
        var output = Variable.void
        
        if shouldBackground {
            output = Chain.background(
                .out {
                    link.run()
                },
                chainEnd
            )
            .run()
        } else {
            output = Chain.link(
                .out {
                    link.run()
                },
                chainEnd
            )
            .run()
        }
        
        print("\(#function): \(output)")
        
        return view
    }
}

@available(iOS 9.0, *)
public extension UIView {
    /// Create a UIView using a chain of events with a centeredLoadingView
    /// - parameters:
    ///     - link: A Chain of events that must be completed for the view to be shown
    ///     - update: A closure to handle updating the view when the chain is completed
    ///     - centeredLoadingView: A view to show while the chain is running
    static func chain(
        link: Chain,
        update: @escaping (UIView) -> Void,
        centeredLoadingView: UIView? = nil
    ) -> UIView {
        chain(link: link,
              update: update,
              shouldBackground: false,
              centeredLoadingView: centeredLoadingView,
              embeddedLoadingView: nil)
    }
    
    /// Create a UIView using a chain of events with an embeddedLoadingView
    /// - parameters:
    ///     - link: A Chain of events that must be completed for the view to be shown
    ///     - update: A closure to handle updating the view when the chain is completed
    ///     - embeddedLoadingView: A view to show while the chain is running
    static func chain(
        link: Chain,
        update: @escaping (UIView) -> Void,
        embeddedLoadingView: UIView
    ) -> UIView {
        chain(link: link,
              update: update,
              shouldBackground: false,
              centeredLoadingView: nil,
              embeddedLoadingView: embeddedLoadingView)
    }
    
    /// Create a UIView using a backgrounded chain of events with a centeredLoadingView
    /// - parameters:
    ///     - link: A Chain of events that must be completed for the view to be shown
    ///     - update: A closure to handle updating the view when the chain is completed
    ///     - centeredLoadingView: A view to show while the chain is running
    static func background(
        link: Chain,
        update: @escaping (UIView) -> Void,
        centeredLoadingView: UIView? = nil
    ) -> UIView {
        chain(link: link,
              update: update,
              shouldBackground: true,
              centeredLoadingView: centeredLoadingView,
              embeddedLoadingView: nil)
    }
    
    /// Create a UIView using a backgrounded chain of events with an embeddedLoadingView
    /// - parameters:
    ///     - link: A Chain of events that must be completed for the view to be shown
    ///     - update: A closure to handle updating the view when the chain is completed
    ///     - embeddedLoadingView: A view to show while the chain is running
    static func background(
        link: Chain,
        update: @escaping (UIView) -> Void,
        embeddedLoadingView: UIView
    ) -> UIView {
        chain(link: link,
              update: update,
              shouldBackground: true,
              centeredLoadingView: nil,
              embeddedLoadingView: embeddedLoadingView)
    }
}
