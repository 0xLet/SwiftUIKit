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
        
        XCTAssertEqual(label.accessibilityLabel, "SomeString")
        XCTAssertEqual(label.accessibilityIdentifier, "SomeID")
        XCTAssertEqual(label.accessibilityTraits, .staticText)
    }
    
    func testButtonADA() {
        let button = Button(title: "SomeString") { print("Hello") }
            .accessibility(label: nil)
        
        XCTAssertEqual(button.accessibilityLabel, "SomeString")
        XCTAssertEqual(button.accessibilityIdentifier, nil)
        XCTAssertEqual(button.accessibilityTraits, .button)
    }
    
    func testComplexViewADA() {
        let view = UIView {
            UIView {
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
        
        XCTAssertEqual(view.allSubviews.compactMap { $0.accessibilityLabel }, accessibilityLabels)
        XCTAssertEqual(view.accessibilityIdentifier, "mainView")
        XCTAssertEqual(view.accessibilityTraits, .none)
        XCTAssertEqual(view.shouldGroupAccessibilityChildren, false)
    }
}
