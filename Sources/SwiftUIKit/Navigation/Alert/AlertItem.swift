//
//  AlertItem.swift
//  
//
//  Created by Zach Eriksen on 12/1/19.
//

import UIKit

public class AlertItem: UIAlertAction {
    
    public class var cancel: UIAlertAction {
        UIAlertAction(title: nil, style: .cancel, handler: nil)
    }
}
