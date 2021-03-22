//
//  Switch.swift
//  
//
//  Created by Zach Eriksen on 11/2/19.
//

import UIKit

/**
 A UISwitch that handles its change event
 */
@available(iOS 9.0, *)
public class Switch: UISwitch {
    private var toggleChangedHandler: ((Bool) -> Void)?
    
    /// Creates a UISwitch
    /// - parameters:
    ///     - isOn: Initial value of the switch (Default: false)
    ///     - toggleChanged: Closure for the the switch's change event (Default: nil)
    public init(
        isOn: Bool = false,
        toggleChanged: ((Bool) -> Void)? = nil
    ) {
        super.init(frame: .zero)
        
        self.isOn = isOn
        self.toggleChangedHandler = toggleChanged
        addTarget(self, action: #selector(handleValueChanged), for: .valueChanged)
    }
    
    /// not implemented
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func handleValueChanged() {
        toggleChangedHandler?(isOn)
    }
}
