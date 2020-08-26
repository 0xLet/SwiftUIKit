//
//  ContractView.swift
//  
//
//  Created by Zach Eriksen on 8/25/20.
//

import UIKit
import Later

@available(iOS 9.0, *)
public class ContractView<View, Value>: UIView where View: UIView {
    public var contract: Contract<Value>?
    
    public init(view: View, _ closure: (View) -> Contract<Value>) {
        super.init(frame: .zero)
        
        self.contract = closure(view)
        
        embed {
            view
        }
        
        contract?.value = contract?.value
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
