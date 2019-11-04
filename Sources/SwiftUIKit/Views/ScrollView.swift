//
//  ScrollView.swift
//  
//
//  Created by Zach Eriksen on 11/4/19.
//

import UIKit

@available(iOS 9.0, *)
public class ScrollView: UIScrollView {
    public init(_ closure: (() -> UIView)? = nil) {
        super.init(frame: .zero)
        
        _ = closure.map { embed(closure: $0) }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
