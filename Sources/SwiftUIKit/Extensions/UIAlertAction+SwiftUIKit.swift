//
//  UIAlertAction+SwiftUIKit.swift
//  
//
//  Created by Zach Eriksen on 12/1/19.
//

import UIKit

public extension UIAlertAction {
    /// Quick Cancel UIAlertAction
    class var cancel: UIAlertAction {
        return UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    }
    
    
    /// Quick Dismiss UIAlertAction
    class var dismiss: UIAlertAction {
        return UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
    }
}
