//
//  UIView+Chain.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 8/26/20.
//

import UIKit
import Chain

@available(iOS 9.0, *)
public extension UIView {
    
    static func chain(
        link: Chain,
        update: @escaping (UIView) -> Void,
        centeredLoadingView: UIView? = nil
    ) -> UIView {
        let view = UIView()
        
        view.center {
            centeredLoadingView ?? LoadingView().start()
        }
        
        let output = Chain.link(
            .out {
                link.run()
            },
            .complete(
                .void {
                    update(view)
                }
            )
        )
        .run()
        
        print(output)
        
        return view
    }
    
    static func chain(
        link: Chain,
        update: @escaping (UIView) -> Void,
        embeddedLoadingView: UIView
    ) -> UIView {
        let view = UIView()
        
        view.embed {
            embeddedLoadingView
        }
        
        let output = Chain.link(
            .out {
                link.run()
            },
            .complete(
                .void {
                    update(view)
                }
            )
        )
        .run()
        
        print(output)
        
        return view
    }
}
