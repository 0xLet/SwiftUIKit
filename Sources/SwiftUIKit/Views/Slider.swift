//
//  Slider.swift
//  
//
//  Created by Zach Eriksen on 11/4/19.
//

import UIKit

@available(iOS 9.0, *)
public class Slider: UISlider {
    private var valueChangedHandler: ((Float) -> Void)?
    
    public init(
        value: Float,
        from: Float,
        to: Float,
        valueChangedHandler: ((Float) -> Void)? = nil
    ) {
        
        super.init(frame: .zero)
        
        self.minimumValue = from
        self.maximumValue = to
        self.value = value
        
        self.valueChangedHandler = valueChangedHandler
        addTarget(self, action: #selector(handleValueChanged), for: .valueChanged)
    }
    
    /// not implemented
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func handleValueChanged(sender: UISlider) {
        valueChangedHandler?(sender.value)
    }
}
