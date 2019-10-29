//
//  View.swift
//  SwiftUIKit-Example
//
//  Created by CRi on 10/29/19.
//  Copyright © 2019 oneleif. All rights reserved.
//

import UIKit

class View: UIView {
    init(backgroundColor: UIColor? = .white) {
        super.init(frame: .zero)
        
        self.backgroundColor = backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
