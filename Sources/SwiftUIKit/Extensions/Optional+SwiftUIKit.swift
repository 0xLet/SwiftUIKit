//
//  Optional+SwiftUIKit.swift
//  
//
//  Created by Zach Eriksen on 8/22/20.
//

public extension Optional {
    func use(value closure: (Wrapped) -> Void) {
        guard let unwrappedSelf = self else {
            return
        }
        closure(unwrappedSelf)
    }
}
