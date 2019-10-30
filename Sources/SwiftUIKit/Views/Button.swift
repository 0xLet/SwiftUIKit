//
//  File.swift
//  
//
//  Created by CRi on 10/30/19.
//

import UIKit

public class Button: UIButton {
    private var action: () -> Void
    
    public init(_ title: String,
                action: @escaping () -> Void,
                forEvent event: UIControl.Event = .touchUpInside) {
        self.action = action
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        self.addTarget(self, action: #selector(handleButtonTap), for: event)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func handleButtonTap() {
        action()
    }
}
