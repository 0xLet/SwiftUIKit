//
//  MultiLineField.swift
//  
//
//  Created by Zach Eriksen on 11/30/19.
//

import UIKit

public class MultiLineField: UITextView {
    public typealias WillValueChangeHandler = (_ sender: UITextView, _ newValue: String, _ input: String) -> Bool
    public typealias DidValueChangeHandler = (String) -> Void
    
    private var willInputUpdateHandler: WillValueChangeHandler?
    private var inputHandler: DidValueChangeHandler?
    
    public init(value: String,
                keyboardType type: UIKeyboardType) {
        
        super.init(frame: .zero, textContainer: nil)
        
        self.text = value
        self.keyboardType = type
        
        delegate = self
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
}

extension MultiLineField: UITextViewDelegate {
    public func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let newValue = NSString(string: textView.text ?? "").replacingCharacters(in: range, with: text)
        
        return willInputUpdateHandler?(textView, newValue, text) ?? true
    }
    
    public func textViewDidChange(_ textView: UITextView) {
        inputHandler?(textView.text ?? "")
    }
}
