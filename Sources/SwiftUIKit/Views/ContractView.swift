//
//  ContractView.swift
//  
//
//  Created by Zach Eriksen on 8/25/20.
//

import UIKit
import Later

@available(iOS 9.0, *)
public class ContractView<View, SomeContract, ContractType>: UIView where View: UIView, SomeContract: Contract<ContractType> {
    public var contract: SomeContract?
    
    public init(view: View, _ closure: (View) -> SomeContract) {
        super.init(frame: .zero)
        
        self.contract = closure(view)
        
        embed {
            view
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
