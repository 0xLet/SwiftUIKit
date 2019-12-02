//
//  UIAlertAction+SwiftUIKit.swift
//  
//
//  Created by Zach Eriksen on 12/1/19.
//

import UIKit

public extension UIAlertAction {
    class var cancel: UIAlertAction {
        UIAlertAction(title: "", style: .cancel, handler: nil)
    }
}
