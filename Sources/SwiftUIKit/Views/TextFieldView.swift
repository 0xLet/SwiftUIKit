//
//  TextFieldView.swift
//  
//
//  Created by Zach Eriksen on 11/4/19.
//

import UIKit

@available(iOS 9.0, *)
public class TextFieldView: UITextField {
    public typealias WillValueChangeHandler = (_ sender: UITextField, _ newValue: String, _ input: String) -> Bool
    public typealias DidValueChangeHandler = (String) -> Void
    
    private var willInputUpdateHandler: WillValueChangeHandler?
    private var inputHandler: DidValueChangeHandler?
    
    public init(value: String,
                placeholder: String,
                keyboardType type: UIKeyboardType) {
        
        super.init(frame: .zero)
        
        self.text = value
        self.placeholder = placeholder
        self.keyboardType = type
        
        delegate = self
        addTarget(self, action: #selector(valueDidChange), for: .editingChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @discardableResult
    public func willInputUpdateHandler(_ willInputUpdateHandler: @escaping WillValueChangeHandler) -> Self {
        self.willInputUpdateHandler = willInputUpdateHandler
        
        return self
    }
    
    @discardableResult
    public func inputHandler(_ inputHandler: @escaping DidValueChangeHandler) -> Self {
        self.inputHandler = inputHandler
        
        return self
    }
    
    @objc private func valueDidChange(_ textField: UITextField) {
        inputHandler?(textField.text ?? "")
    }
}

@available(iOS 9.0, *)
extension TextFieldView: UITextFieldDelegate {
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newValue = NSString(string: textField.text ?? "").replacingCharacters(in: range, with: string)
        
        return willInputUpdateHandler?(textField, newValue, string) ?? true
    }
}

