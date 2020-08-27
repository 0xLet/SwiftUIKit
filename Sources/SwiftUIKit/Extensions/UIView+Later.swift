//
//  UIView+Later.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 8/26/20.
//

import UIKit
import Later

@available(iOS 9.0, *)
public extension UIView {
    static func later(_ laterView: (Later.Type) -> LaterValue<UIView>) -> UIView {
        let view = UIView()
        
        view.center {
            LoadingView()
                .start()
        }
        
        laterView(Later.self)
            .whenSuccess { embeddedView in
                Later.main {
                    view.clear()
                        .embed {
                            embeddedView
                    }
                }
                
        }
        
        return view
    }
    
    static func later(centeredLoadingView: UIView,
                      withSize size: CGSize? = nil,
                      _ laterView: (Later.Type) -> LaterValue<UIView>) -> UIView {
        
        let view = UIView()
        
        view.center {
            centeredLoadingView
                .configure {
                    if let size = size {
                        $0.frame(height: Float(size.height),
                                 width: Float(size.width))
                    }
            }
        }
        
        laterView(Later.self)
            .whenSuccess { embeddedView in
                Later.main {
                    view.clear()
                        .embed {
                            embeddedView
                    }
                }
                
        }
        
        return view
    }
    
    static func later(embeddedLoadingView: UIView,
                      withPadding padding: Float = 0,
                      _ laterView: (Later.Type) -> LaterValue<UIView>) -> UIView {
        let view = UIView()
        
        view.embed(withPadding: padding) {
            embeddedLoadingView
        }
        
        laterView(Later.self)
            .whenSuccess { embeddedView in
                Later.main {
                    view.clear()
                        .embed {
                            embeddedView
                    }
                }
                
        }
        
        return view
    }
}
