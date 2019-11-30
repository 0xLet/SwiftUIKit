//
//  ZStack.swift
//  
//
//  Created by Zach Eriksen on 11/27/19.
//

import UIKit

@available(iOS 9.0, *)
public class ZStack: UIView {
    public var views: [UIView] = []
    
    public init(_ closure: () -> [UIView]) {
        views = closure()
        super.init(frame: .zero)
        
        views.forEach {
            addSubview($0)
            $0.sizeToFit()
        }
    }
    
    public init(_ closure: () -> [UIView?]) {
           views = closure()
               .compactMap { $0 }
           super.init(frame: .zero)
           
           views.forEach {
               addSubview($0)
               $0.sizeToFit()
           }
       }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
