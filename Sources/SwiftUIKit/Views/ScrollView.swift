//
//  ScrollView.swift
//  
//
//  Created by Zach Eriksen on 11/4/19.
//

import UIKit

/**
 A UIScrollView
 */
@available(iOS 9.0, *)
public class ScrollView: UIScrollView {
    /// Creates a UIScrollView
    /// - parameter closure: Scrollable view (Default: nil)
    public init(_ closure: (() -> UIView)? = nil) {
        super.init(frame: .zero)
        
        _ = closure.map { embed($0) }
    }
    
    /// not implemented
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
