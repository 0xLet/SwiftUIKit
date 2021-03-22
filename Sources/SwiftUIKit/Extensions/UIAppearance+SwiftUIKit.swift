//
//  UIAppearance+SwiftUIKit.swift
//  
//
//  Created by Zach Eriksen on 8/25/20.
//

import UIKit

@available(iOS 9.0, *)
public extension UIAppearance where Self: UIView {
    /// Create an `ObservedView` from any UIAppearance where Self is of type UIView
    func observed<Value>(
        initialValue: Value,
        onChangeHandler: @escaping (_ newValue: Value?, _ view: Self) -> Void
    ) -> ObservedView<Self, Value> {
        ObservedView(view: self,
                     initialValue: initialValue,
                     onChangeHandler: onChangeHandler)
    }
}
