//
//  ObservedView.swift
//  
//
//  Created by Zach Eriksen on 8/25/20.
//

import E
import UIKit
import Chain
import Observation

@available(iOS 9.0, *)
public class ObservedView<View, Value>: UIView where View: UIView {
    private var observedValue: ObservedValue<Value> = ObservedValue()
    
    private var observedView: View
    private var onChangeHandler: (Value?, View) -> Void
    
    public init(
        view: View,
        initialValue: Value?,
        onChangeHandler: @escaping (_ newValue: Value?, _ view: View) -> Void
    ) {
        self.observedView = view
        self.onChangeHandler = onChangeHandler
        super.init(frame: .zero)
        
        observedValue.didChangeHandler = .complete(
            .void { [weak self] in
                self?.onChange()
            }
        )
        
        if let initialValue = initialValue {
            observedValue.update(value: initialValue)
        }
        
        embed {
            view
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @discardableResult
    public func update(value: Value) -> Variable {
        observedValue.update(value: value)
    }
    
    private func onChange() {
        onChangeHandler(observedValue.value, observedView)
    }
}
