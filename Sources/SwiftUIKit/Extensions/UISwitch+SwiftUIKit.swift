//
//  UISwitch+SwiftUIKit.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 7/7/20.
//

import UIKit

public extension UISwitch {
    /// Turn the UISwitch on or off
    @discardableResult
    func turn(on: Bool) -> Self {
        DispatchQueue.main.async {
            self.isOn = on
        }
        
        return self
    }
    
    /// Turn the UISwitch on
    @discardableResult
    func turnOn() -> Self {
        turn(on: true)
    }
    
    /// Turn the UISwitch off
    @discardableResult
    func turnOff() -> Self {
        turn(on: false)
    }
}
