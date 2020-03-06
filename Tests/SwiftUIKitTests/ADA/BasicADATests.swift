//
//  BasicADATests.swift
//  
//
//  Created by Zach Eriksen on 3/2/20.
//

import Foundation
import XCTest
@testable import SwiftUIKit

@available(iOS 9.0, *)
final class BasicADATests: XCTestCase {
    func testLabelADA() {
        
        let label = Label("SomeString")
            .accessibility(identifier: "SomeID")
            .padding()
            .padding()
            .padding()
            .debug()
        
        assert(label.accessibilityLabel == "SomeString")
        assert(label.accessibilityIdentifier == "SomeID")
        assert(label.accessibilityTraits == .staticText)
    }
    
    func testButtonADA() {
        let button = Button("SomeString") { print("Hello") }
            .accessibility(label: nil)
        
        assert(button.accessibilityLabel == "SomeString")
        assert(button.accessibilityIdentifier == nil)
        assert(button.accessibilityTraits == .button)
    }
    
    func testComplexViewADA() {
        let view = View {
            View {
                HStack {
                    [
                    Label("Hello World"),
                    Label("Ipsum")
                    ]
                }
            }
        }
        .accessibility(identifier: "mainView")
        
        let accessibilityLabels = ["Hello World", "Ipsum"]
        
        assert(view.allSubviews.compactMap { $0.accessibilityLabel } == accessibilityLabels)
        assert(view.accessibilityIdentifier == "mainView")
        assert(view.accessibilityTraits == .none)
        assert(view.shouldGroupAccessibilityChildren == false)
    }
    
    static var allTests = [
        ("testLabelADA", testLabelADA),
        ("testButtonADA", testButtonADA),
        ("testComplexViewADA", testComplexViewADA)
    ]
}
