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
    /// - parameter content: Scrollable view (Default: nil)
    public init(content: (() -> UIView)? = nil) {
        super.init(frame: .zero)
        
        guard let content = content else {
            return
        }
        
        embed(content: content)
    }
    
    /// not implemented
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
