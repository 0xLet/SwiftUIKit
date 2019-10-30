//
//  Label.swift
//  SwiftUIKit-Example
//
//  Created by CRi on 10/29/19.
//  Copyright © 2019 oneleif. All rights reserved.
//

import UIKit

class Label: UILabel {
    init(_ text: String) {
        super.init(frame: .zero)
        
        self.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
