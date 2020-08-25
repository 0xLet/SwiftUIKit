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
    public weak var contract: SomeContract?
    public let view: View
    
    public init(view: View, _ closure: (View) -> SomeContract) {
        self.view = view
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
