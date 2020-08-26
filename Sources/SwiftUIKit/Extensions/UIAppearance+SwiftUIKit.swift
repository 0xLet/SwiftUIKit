//
//  File.swift
//  
//
//  Created by Zach Eriksen on 8/25/20.
//

import UIKit
import Later

@available(iOS 9.0, *)
public extension UIAppearance where Self: UIView {
    func contract<Value>(_ closure: (Self) -> Contract<Value>) -> ContractView<Self, Value> {
        ContractView(view: self) { view in
            closure(view)
        }
    }
}
