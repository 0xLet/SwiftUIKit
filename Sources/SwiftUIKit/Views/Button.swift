//
//  File.swift
//  
//
//  Created by Zach Eriksen on 10/30/19.
//

import UIKit

@available(iOS 9.0, *)
public class Button: UIButton {
    private var action: (() -> Void)?
    
    public init(
        title: String,
        titleColor: UIColor? = nil,
        backgroundColor: UIColor? = nil,
        forEvent event: UIControl.Event = .touchUpInside,
        action: (() -> Void)? = nil
    ) {
        self.action = action
        super.init(frame: .zero)
        
        self.backgroundColor = backgroundColor
        self.setTitleColor(titleColor ?? .systemBlue, for: .normal)
        self.setTitle(title, for: .normal)
        self.addTarget(self, action: #selector(handleButtonTap), for: event)
        
        accessibility(label: title, traits: .button)
    }
    
    public init(
        forEvent event: UIControl.Event = .touchUpInside,
        action: (() -> Void)? = nil,
        labelView: () -> UIView
    ) {
        self.action = action
        super.init(frame: .zero)
        
        embed {
            labelView()
                .gesture { UITapGestureRecognizer(target: self, action: #selector(handleButtonTap)) }
        }
        
        self.addTarget(self, action: #selector(handleButtonTap), for: event)
    }
    
    @discardableResult
    public func setAction(_ action: (() -> Void)?) -> Self {
        self.action = action
        
        return self
    }
    
    /// not implemented
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func handleButtonTap() {
        action?()
    }
}
