//
//  UIViewController+SwiftUIKit.swift
//  
//
//  Created by Zach Eriksen on 11/4/19.
//

import UIKit

@available(iOS 9.0, *)
public extension UIViewController {
    convenience init(_ closure: (() -> UIView)) {
        self.init()
        
        view.embed(closure)
    }
}
