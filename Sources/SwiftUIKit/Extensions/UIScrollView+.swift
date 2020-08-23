//
//  UIScrollView+.swift
//  
//
//  Created by Zach Eriksen on 11/4/19.
//

import UIKit

@available(iOS 9.0, *)
public extension UIScrollView {
    convenience init(_ closure: (() -> UIView)? = nil) {
        self.init(frame: .zero)
        
        _ = closure.map { embed($0) }
    }
}
