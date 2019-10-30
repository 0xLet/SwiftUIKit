//
//  Label.swift
//  SwiftUIKit-Example
//
//  Created by Zach Eriksen on 10/29/19.
//  Copyright © 2019 oneleif. All rights reserved.
//

import UIKit

@available(iOS 9.0, *)
public class Label: UILabel {
    public init(_ text: String) {
        super.init(frame: .zero)
        
        self.text = text
        
        accessibility(label: text, traits: .staticText)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
