//
//  File.swift
//  
//
//  Created by Zach Eriksen on 10/30/19.
//

import UIKit

@available(iOS 9.0, *)
public class Button: UIButton {
    private var action: () -> Void
    
    public init(_ title: String,
                titleColor: UIColor = .white,
                backgroundColor: UIColor? = nil,
                forEvent event: UIControl.Event = .touchUpInside,
                _ action: @escaping () -> Void) {
        self.action = action
        super.init(frame: .zero)
        
        self.backgroundColor = backgroundColor
        self.setTitleColor(titleColor, for: .normal)
        self.setTitle(title, for: .normal)
        self.addTarget(self, action: #selector(handleButtonTap), for: event)
        
        accessibility(label: title, traits: .button)
    }
    
    public init(_ action: @escaping () -> Void,
                forEvent event: UIControl.Event = .touchUpInside,
                _ closure: () -> UIView) {
        self.action = action
        super.init(frame: .zero)
        
        embed {
            closure()
            .padding(0)
            .gesture { UITapGestureRecognizer(target: self, action: #selector(handleButtonTap)) }
        }
        
        self.addTarget(self, action: #selector(handleButtonTap), for: event)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func handleButtonTap() {
        action()
    }
}
