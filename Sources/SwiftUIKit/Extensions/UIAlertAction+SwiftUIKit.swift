//
//  UIAlertAction+SwiftUIKit.swift
//  
//
//  Created by Zach Eriksen on 12/1/19.
//

import UIKit

public extension UIAlertAction {
    class var cancel: UIAlertAction {
        UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    }
    
    class var dismiss: UIAlertAction {
        UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
    }
}
