//
//  BasicSwiftUIKitTests.swift
//  
//
//  Created by Zach Eriksen on 3/2/20.
//

import Foundation
import XCTest
@testable import SwiftUIKit

@available(iOS 10.0, *)
final class BasicSwiftUIKitTests: XCTestCase {
    
    func testDefaultView() {
        
        let view = UIView()
        
        XCTAssertNil(view.backgroundColor)
        XCTAssert(view.allSubviews.count == 0)
        XCTAssert(view.constraints.count == 0)
    }
    
    func testEmbedView() {
        
        let view = UIView()
        
        let viewToEmbed = UIView()
        
        view.embed {
            viewToEmbed
        }
        
        let leadingConstraint = view.leadingConstraints.first
        let bottomConstraint = view.bottomConstraints.first
        let trailingConstraint = view.trailingConstraints.first
        let topConstraint = view.topConstraints.first
        
        XCTAssertNil(view.backgroundColor)
        XCTAssert(view.allSubviews.count == 1)
        XCTAssert(view.constraints.count == 4)
        XCTAssertEqual(leadingConstraint?.constant, 0)
        XCTAssertEqual(bottomConstraint?.constant, 0)
        XCTAssertEqual(trailingConstraint?.constant, 0)
        XCTAssertEqual(topConstraint?.constant, 0)
        
        view.update(padding: 16)
        
        XCTAssert(view.constraints.count == 4)
        XCTAssertEqual(leadingConstraint?.constant, 16)
        XCTAssertEqual(bottomConstraint?.constant, -16)
        XCTAssertEqual(trailingConstraint?.constant, -16)
        XCTAssertEqual(topConstraint?.constant, 16)
    }
    
    func testEmbedView_WithOnePadding() {
        
        let view = UIView()
        
        let viewToEmbed = UIView()
        
        view.embed(withPadding: [
            .leading(16)
        ]) {
            viewToEmbed
        }
        
        let constraint = view.leadingConstraints.first
        
        XCTAssertNil(view.backgroundColor)
        XCTAssert(view.allSubviews.count == 1)
        XCTAssert(view.constraints.count == 1)
        XCTAssertEqual(constraint?.constant, 16)
        
        view.update(padding: .leading(8))
        view.update(padding: .trailing(16))
        
        XCTAssertEqual(constraint?.constant, 8)
        XCTAssertEqual(view.constraints.count, 1)
    }
    
    func testEmbedView_WithTwoPadding() {
        
        let view = UIView()
        
        let viewToEmbed = UIView()
        
        view.embed(withPadding: [
            .leading(16),
            .bottom(16)
        ]) {
            viewToEmbed
        }
        
        let leadingConstraint = view.leadingConstraints.first
        let bottomConstraint = view.bottomConstraints.first
        
        XCTAssertNil(view.backgroundColor)
        XCTAssert(view.allSubviews.count == 1)
        XCTAssert(view.constraints.count == 2)
        XCTAssertEqual(leadingConstraint?.constant, 16)
        XCTAssertEqual(bottomConstraint?.constant, -16)
        
        view.update(padding: .leading(8))
        view.update(padding: .bottom(32))
        
        XCTAssert(view.constraints.count == 2)
        XCTAssertEqual(leadingConstraint?.constant, 8)
        XCTAssertEqual(bottomConstraint?.constant, -32)
    }
    
    func testEmbedView_WithThreePadding() {
        
        let view = UIView()
        
        let viewToEmbed = UIView()
        
        view.embed(withPadding: [
            .leading(16),
            .bottom(16),
            .trailing(16)
        ]) {
            viewToEmbed
        }
        
        let leadingConstraint = view.leadingConstraints.first
        let bottomConstraint = view.bottomConstraints.first
        let trailingConstraint = view.trailingConstraints.first
        
        XCTAssertNil(view.backgroundColor)
        XCTAssert(view.allSubviews.count == 1)
        XCTAssert(view.constraints.count == 3)
        XCTAssertEqual(leadingConstraint?.constant, 16)
        XCTAssertEqual(bottomConstraint?.constant, -16)
        XCTAssertEqual(trailingConstraint?.constant, -16)
        
        view.update(padding: [.leading(32), .trailing(32), .bottom(32)])
        
        XCTAssert(view.constraints.count == 3)
        XCTAssertEqual(leadingConstraint?.constant, 32)
        XCTAssertEqual(bottomConstraint?.constant, -32)
        XCTAssertEqual(trailingConstraint?.constant, -32)
    }
    
    func testEmbedView_WithAllPadding() {
        
        let view = UIView()
        
        let viewToEmbed = UIView()
        
        view.embed(withPadding: [
            .leading(16),
            .bottom(16),
            .trailing(16),
            .top(16)
        ]) {
            viewToEmbed
        }
        
        let leadingConstraint = view.leadingConstraints.first
        let bottomConstraint = view.bottomConstraints.first
        let trailingConstraint = view.trailingConstraints.first
        let topConstraint = view.topConstraints.first
        
        XCTAssertNil(view.backgroundColor)
        XCTAssert(view.allSubviews.count == 1)
        XCTAssert(view.constraints.count == 4)
        XCTAssertEqual(leadingConstraint?.constant, 16)
        XCTAssertEqual(bottomConstraint?.constant, -16)
        XCTAssertEqual(trailingConstraint?.constant, -16)
        XCTAssertEqual(topConstraint?.constant, 16)
        
        view.update(padding: 32)
        
        XCTAssert(view.constraints.count == 4)
        XCTAssertEqual(leadingConstraint?.constant, 32)
        XCTAssertEqual(bottomConstraint?.constant, -32)
        XCTAssertEqual(trailingConstraint?.constant, -32)
        XCTAssertEqual(topConstraint?.constant, 32)
    }
    
    func testEmbedViews() {
        
        let view = UIView()
        
        let viewToEmbed = UIView()
        
        view.embed {
            viewToEmbed.embed {
                UIView()
            }
        }
        
        XCTAssertNil(view.backgroundColor)
        XCTAssert(view.allSubviews.count == 2)
        XCTAssert(view.constraints.count == 4)
    }
    
    func testVStackView() {
        
        let viewToEmbed = UIView()
        
        let stack = VStack {
            [
                viewToEmbed
            ]
        }
        
        XCTAssert(stack.subviews.first.map { type(of: $0) } == UIStackView.self)
        XCTAssert(stack.allSubviews.count == 2)
    }
    
    func testHStackView() {
        
        let viewToEmbed = UIView()
        
        let stack = HStack {
            [
                viewToEmbed
            ]
        }
        
        XCTAssert(stack.subviews.first.map { type(of: $0) } == UIStackView.self)
        XCTAssert(stack.allSubviews.count == 2)
    }
    
    func testZStackView() {
        
        let viewToEmbed = UIView()
        
        let stack = ZStack {
            [
                viewToEmbed
            ]
        }
        
        XCTAssert(stack.allSubviews.count == 1)
    }
    
    func testPaddingView() {
        
        let view = UIView().padding()
        
        XCTAssert(view.allSubviews.count == 1)
    }
    
    func testConfigureView() {
        
        let view = UIView(backgroundColor: .red)
            .configure {
                $0.backgroundColor = .blue
                $0.isHidden = true
                $0.tintColor = .green
                $0.clipsToBounds = true
        }
        
        let otherView = UIView(backgroundColor: .blue)
            .hide(if: true)
            .clipsToBounds(true)
        
        XCTAssert(view.backgroundColor == .blue)
        XCTAssert(view.isHidden == true)
        XCTAssert(view.tintColor == .green)
        XCTAssert(view.clipsToBounds == true)
        
        XCTAssert(view.backgroundColor == otherView.backgroundColor)
        XCTAssert(view.isHidden == otherView.isHidden)
        XCTAssert(view.clipsToBounds == otherView.clipsToBounds)
    }
    
    func testLayerView() {
        
        let view = UIView()
            .layer {
                $0.borderColor = UIColor.blue.cgColor
                $0.borderWidth = 3
                $0.cornerRadius = 8
                $0.masksToBounds = true
        }
        
        let otherView = UIView()
            .layer(cornerRadius: 8)
        
        XCTAssert(view.layer.borderColor == UIColor.blue.cgColor)
        XCTAssert(view.layer.borderWidth == 3)
        XCTAssert(view.layer.cornerRadius == 8)
        XCTAssert(view.layer.masksToBounds == true)
        
        XCTAssert(view.layer.cornerRadius == otherView.layer.cornerRadius)
    }
    
    func testClearView() {
        
        let switchView = Switch()
        let uiSwitchView = UISwitch()
        
        let view = UIView().embed {
            UIView().vstack {
                [
                    Image(.blue),
                    Switch()
                ]
            }
        }
        
        let otherView = UIView().embed {
            VStack {
                [
                    Image(.blue),
                    Switch()
                ]
            }
        }
        
        let viewWithoutSwitch = UIView().embed {
            UIView().vstack {
                [
                    Image(.blue)
                ]
            }
        }
        
        // Will fail unless...
        // === (iOS >= 13) ===
        XCTAssert(switchView.allSubviews.count == 8, "switchView.allSubviews.count == \(switchView.allSubviews.count)")
        XCTAssert(uiSwitchView.allSubviews.count == 8, "uiSwitchView.allSubviews.count == \(uiSwitchView.allSubviews.count)")
        XCTAssert(view.allSubviews.count == 12, "view.allSubviews.count == \(view.allSubviews.count)")
        XCTAssert(otherView.allSubviews.count == 12, "otherView.allSubviews.count == \(otherView.allSubviews.count)")
        // === (End) ===
        
        XCTAssert(viewWithoutSwitch.allSubviews.count == 3, "viewWithoutSwitch.allSubviews.count == \(viewWithoutSwitch.allSubviews.count)")
        
        switchView.clear()
        uiSwitchView.clear()
        
        view.clear()
        otherView.clear()
        viewWithoutSwitch.clear()
        
        XCTAssert(switchView.allSubviews.count == 0)
        XCTAssert(uiSwitchView.allSubviews.count == 0)
        
        XCTAssert(view.allSubviews.count == 0)
        XCTAssert(otherView.allSubviews.count == 0)
        XCTAssert(viewWithoutSwitch.allSubviews.count == 0)
    }
    
    func testLayoutConstraint() {
        let innerView = UIView(backgroundColor: .blue)
            .frame(height: 100, width: 100)
        let stack = ZStack {
            [
                innerView
            ]
        }
        
        
        stack
            .activateLayoutConstraints {
                [
                    innerView.centerXAnchor.constraint(equalTo: stack.centerXAnchor),
                    innerView.centerYAnchor.constraint(equalTo: stack.centerYAnchor)
                ]
        }
        
        XCTAssert(innerView.constraints.count == 2)
        XCTAssert(stack.constraints.count == 2)
    }
    
    static var allTests = [
        ("testDefaultView", testDefaultView),
        ("testEmbedViews", testEmbedViews),
        ("testEmbedView", testEmbedView),
        ("testVStackView", testVStackView),
        ("testHStackView", testHStackView),
        ("testZStackView", testZStackView),
        ("testPaddingView", testPaddingView),
        ("testConfigureView", testConfigureView),
        ("testLayerView", testLayerView),
        ("testClearView", testClearView),
        ("testLayoutConstraint", testLayoutConstraint)
    ]
}
