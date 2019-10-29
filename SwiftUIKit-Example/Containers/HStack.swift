//
//  HStack.swift
//  SwiftUIKit-Example
//
//  Created by Zach Eriksen on 10/29/19.
//  Copyright © 2019 oneleif. All rights reserved.
//

import UIKit

class HStack: UIView {
    var views: [UIView] = []
    
    init(withSpacing spacing: Float = 0,
         alignment: UIStackView.Alignment = .fill,
         distribution: UIStackView.Distribution = .fill,
         closure: () -> [UIView]) {
        views = closure()
        super.init(frame: .zero)
        
        hstack(withSpacing: spacing,
               alignment: alignment,
               distribution: distribution,
               closure: closure)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
