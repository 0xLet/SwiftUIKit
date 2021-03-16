//
//  ObservedView.swift
//  
//
//  Created by Zach Eriksen on 8/25/20.
//

import UIKit
import Observation

@available(iOS 9.0, *)
public class ObservedView<View, Value>: UIView where View: UIView {
    @Observed public var observedValue: Value?
    
    public init(
        view: View,
        initialValue: Value?,
        onChangeHandler: @escaping (_ newValue: Value?, _ view: View) -> Void
    ) {
        super.init(frame: .zero)
        
        _observedValue.didChangeHandler = .complete(
            .void { [weak self] in
                onChangeHandler(self?.observedValue, view)
            }
        )
        
        observedValue = initialValue
        
        embed {
            view
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
