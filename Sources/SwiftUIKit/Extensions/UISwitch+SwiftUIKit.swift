//
//  UISwitch+SwiftUIKit.swift
//  SwiftUIKit
//
//  Created by Zach Eriksen on 7/7/20.
//

import UIKit

public extension UISwitch {
    @discardableResult
    func turn(on: Bool) -> Self {
        DispatchQueue.main.async {
            self.isOn = on
        }
        
        return self
    }
    
    @discardableResult
    func turnOn() -> Self {
        turn(on: true)
    }
    
    @discardableResult
    func turnOff() -> Self {
        turn(on: false)
    }
}
