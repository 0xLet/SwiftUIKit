//
//  SafeAreaView.swift
//  
//
//  Created by Zach Eriksen on 10/30/19.
//

import UIKit

/// A View that respects the SafeArea
@available(iOS 11.0, *)
public class SafeAreaView: UIView {
    
    /// Create a SafeAreaView
    /// - Parameters:
    ///     - closure: A trailing closure that accepts a view
    public init(_ closure: () -> UIView) {
        let view = closure()
        super.init(frame: .zero)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        
        let margins = layoutMarginsGuide
        let guide = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            view.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1.0),
            guide.bottomAnchor.constraint(equalToSystemSpacingBelow: view.bottomAnchor, multiplier: 1.0)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
