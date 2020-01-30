//
//  LoadingView.swift
//  
//
//  Created by Zach Eriksen on 11/27/19.
//

import UIKit

@available(iOS 9.0, *)
public class LoadingView: UIActivityIndicatorView {
    public init(forStyle style: UIActivityIndicatorView.Style? = nil) {
        guard let style = style else {
            super.init(style: .white)
            return
        }
        
        super.init(style: style)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

@available(iOS 9.0, *)
public extension LoadingView {
    @discardableResult
    func start() -> Self {
        
        startAnimating()
        
        return self
    }
    
    @discardableResult
    func stop() -> Self {
        
        stopAnimating()
        
        return self
    }
    
    @discardableResult
    func play(_ ifTrue: () -> Bool) -> Self {
        return ifTrue() ? start() : stop()
    }
    
    @discardableResult
    func color(_ color: UIColor) -> Self {
        self.color = color
        
        return self
    }
    
}
