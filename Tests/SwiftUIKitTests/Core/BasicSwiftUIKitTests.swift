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
        XCTAssertEqual(view.allSubviews.count, 0)
        XCTAssertEqual(view.constraints.count, 0)
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
        XCTAssertEqual(view.allSubviews.count, 1)
        XCTAssertEqual(view.constraints.count, 4)
        XCTAssertEqual(leadingConstraint?.constant, 0)
        XCTAssertEqual(bottomConstraint?.constant, 0)
        XCTAssertEqual(trailingConstraint?.constant, 0)
        XCTAssertEqual(topConstraint?.constant, 0)
        
        view.update(padding: 16)
        
        XCTAssertEqual(view.constraints.count, 4)
        XCTAssertEqual(leadingConstraint?.constant, 16)
        XCTAssertEqual(bottomConstraint?.constant, -16)
        XCTAssertEqual(trailingConstraint?.constant, -16)
        XCTAssertEqual(topConstraint?.constant, 16)
    }
    
    func testEmbedView_WithOnePadding() {
        
        let view = UIView()
        
        let viewToEmbed = UIView()
        
        view.embed(leadingPadding: 16) {
            viewToEmbed
        }
        
        let constraint = view.leadingConstraints.first
        
        XCTAssertNil(view.backgroundColor)
        XCTAssertEqual(view.allSubviews.count, 1)
        XCTAssertEqual(view.constraints.count, 1)
        XCTAssertEqual(constraint?.constant, 16)
        
        view.update(leadingPadding: 8)
        view.update(trailingPadding: 16)
        
        XCTAssertEqual(constraint?.constant, 8)
        XCTAssertEqual(view.constraints.count, 1)
    }
    
    func testEmbedView_WithTwoPadding() {
        
        let view = UIView()
        
        let viewToEmbed = UIView()
        
        view.embed(
            leadingPadding: 16,
            bottomPadding: 16
        ) {
            viewToEmbed
        }
        
        let leadingConstraint = view.leadingConstraints.first
        let bottomConstraint = view.bottomConstraints.first
        
        XCTAssertNil(view.backgroundColor)
        XCTAssertEqual(view.allSubviews.count, 1)
        XCTAssertEqual(view.constraints.count, 2)
        XCTAssertEqual(leadingConstraint?.constant, 16)
        XCTAssertEqual(bottomConstraint?.constant, -16)
        
        view.update(leadingPadding: 8)
        view.update(bottomPadding: 32)
        
        XCTAssertEqual(view.constraints.count, 2)
        XCTAssertEqual(leadingConstraint?.constant, 8)
        XCTAssertEqual(bottomConstraint?.constant, -32)
    }
    
    func testEmbedView_WithThreePadding() {
        
        let view = UIView()
        
        let viewToEmbed = UIView()
        
        view.embed(
            leadingPadding: 16,
            trailingPadding: 16,
            bottomPadding: 16
        ) {
            viewToEmbed
        }
        
        let leadingConstraint = view.leadingConstraints.first
        let bottomConstraint = view.bottomConstraints.first
        let trailingConstraint = view.trailingConstraints.first
        
        XCTAssertNil(view.backgroundColor)
        XCTAssertEqual(view.allSubviews.count, 1)
        XCTAssertEqual(view.constraints.count, 3)
        XCTAssertEqual(leadingConstraint?.constant, 16)
        XCTAssertEqual(bottomConstraint?.constant, -16)
        XCTAssertEqual(trailingConstraint?.constant, -16)
        
        view.update(leadingPadding: 32, trailingPadding: 32, bottomPadding: 32)
        
        XCTAssertEqual(view.constraints.count, 3)
        XCTAssertEqual(leadingConstraint?.constant, 32)
        XCTAssertEqual(bottomConstraint?.constant, -32)
        XCTAssertEqual(trailingConstraint?.constant, -32)
    }
    
    func testEmbedView_WithAllPadding() {
        
        let view = UIView()
        
        let viewToEmbed = UIView()
        
        view.embed(
            leadingPadding: 16,
            topPadding: 16,
            trailingPadding: 16,
            bottomPadding: 16
        ) {
            viewToEmbed
        }
        
        let leadingConstraint = view.leadingConstraints.first
        let bottomConstraint = view.bottomConstraints.first
        let trailingConstraint = view.trailingConstraints.first
        let topConstraint = view.topConstraints.first
        
        XCTAssertNil(view.backgroundColor)
        XCTAssertEqual(view.allSubviews.count, 1)
        XCTAssertEqual(view.constraints.count, 4)
        XCTAssertEqual(leadingConstraint?.constant, 16)
        XCTAssertEqual(bottomConstraint?.constant, -16)
        XCTAssertEqual(trailingConstraint?.constant, -16)
        XCTAssertEqual(topConstraint?.constant, 16)
        
        view.update(padding: 32)
        
        XCTAssertEqual(view.constraints.count, 4)
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
        XCTAssertEqual(view.allSubviews.count, 2)
        XCTAssertEqual(view.constraints.count, 4)
    }
    
    func testVStackView() {
        
        let viewToEmbed = UIView()
        
        let stack = VStack {
            [
                viewToEmbed
            ]
        }
        
        XCTAssert(stack.subviews.first.map { type(of: $0) } == UIStackView.self)
        XCTAssertEqual(stack.allSubviews.count, 2)
        XCTAssertEqual(stack.views.count, 1)
    }
    
    func testVStackViewAppend_one() {
        
        let viewToEmbed = UIView()
        
        let stack = VStack {
            [
                viewToEmbed
            ]
        }
        
        stack.update { (views) in
            views.append(UIView())
        }
        
        XCTAssert(stack.subviews.first.map { type(of: $0) } == UIStackView.self)
        XCTAssertEqual(stack.allSubviews.count, 3)
        XCTAssertEqual(stack.views.count, 2)
    }
    
    func testVStackViewAppend_five() {
        
        let viewToEmbed = UIView()
        
        let stack = VStack {
            [
                viewToEmbed
            ]
        }
        
        stack.update { (views) in
            views += (0 ... 4).map { Label("\($0)") }
        }
        
        XCTAssert(stack.subviews.first.map { type(of: $0) } == UIStackView.self)
        XCTAssertEqual(stack.allSubviews.count, 7)
        XCTAssertEqual(stack.views.count, 6)
    }
    
    func testHStackView() {
        
        let viewToEmbed = UIView()
        
        let stack = HStack {
            [
                viewToEmbed
            ]
        }
        
        XCTAssert(stack.subviews.first.map { type(of: $0) } == UIStackView.self)
        XCTAssertEqual(stack.allSubviews.count, 2)
        XCTAssertEqual(stack.views.count, 1)
    }
    
    func testHStackViewAppend_one() {
        
        let viewToEmbed = UIView()
        
        let stack = VStack {
            [
                viewToEmbed
            ]
        }
        
        stack.update { (views) in
            views.append(UIView())
        }
        
        XCTAssert(stack.subviews.first.map { type(of: $0) } == UIStackView.self)
        XCTAssertEqual(stack.allSubviews.count, 3)
        XCTAssertEqual(stack.views.count, 2)
    }
    
    func testHStackViewAppend_five() {
        let viewToEmbed = UIView()
        
        let stack = VStack {
            [
                viewToEmbed
            ]
        }
        
        stack.update { (views) in
            views += (0 ... 4).map { Label("\($0)") }
        }
        
        XCTAssert(stack.subviews.first.map { type(of: $0) } == UIStackView.self)
        XCTAssertEqual(stack.allSubviews.count, 7)
        XCTAssertEqual(stack.views.count, 6)
    }
    
    func testZStackView() {
        
        let viewToEmbed = UIView()
        
        let stack = ZStack {
            [
                viewToEmbed
            ]
        }
        
        XCTAssertEqual(stack.allSubviews.count, 1)
    }
    
    func testPaddingView() {
        
        let view = UIView().padding()
        
        XCTAssertEqual(view.allSubviews.count, 1)
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
        
        XCTAssertEqual(view.backgroundColor, .blue)
        XCTAssertEqual(view.isHidden, true)
        XCTAssertEqual(view.tintColor, .green)
        XCTAssertEqual(view.clipsToBounds, true)
        
        XCTAssertEqual(view.backgroundColor, otherView.backgroundColor)
        XCTAssertEqual(view.isHidden, otherView.isHidden)
        XCTAssertEqual(view.clipsToBounds, otherView.clipsToBounds)
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
        
        XCTAssertEqual(view.layer.borderColor, UIColor.blue.cgColor)
        XCTAssertEqual(view.layer.borderWidth, 3)
        XCTAssertEqual(view.layer.cornerRadius, 8)
        XCTAssertEqual(view.layer.masksToBounds, true)
        
        XCTAssertEqual(view.layer.cornerRadius, otherView.layer.cornerRadius)
    }
    
    func testClearView() {
        
        let switchView = Switch()
        let uiSwitchView = UISwitch()
        
        let view = UIView().embed {
            UIView().vstack {
                [
                    Image(color: .blue),
                    Switch()
                ]
            }
        }
        
        let otherView = UIView().embed {
            VStack {
                [
                    Image(color: .blue),
                    Switch()
                ]
            }
        }
        
        let viewWithoutSwitch = UIView().embed {
            UIView().vstack {
                [
                    Image(color: .blue)
                ]
            }
        }
        
        /** Will fail unless...
         === (iOS >= 13) ===
         */
        XCTAssertEqual(switchView.allSubviews.count, 8)
        XCTAssertEqual(uiSwitchView.allSubviews.count, 8)
        XCTAssertEqual(view.allSubviews.count, 12)
        XCTAssertEqual(otherView.allSubviews.count, 12)
        /**
         === (End) ===
         */
        
        XCTAssertEqual(viewWithoutSwitch.allSubviews.count, 3)
        
        switchView.clear()
        uiSwitchView.clear()
        
        view.clear()
        otherView.clear()
        viewWithoutSwitch.clear()
        
        XCTAssertEqual(switchView.allSubviews.count, 0)
        XCTAssertEqual(uiSwitchView.allSubviews.count, 0)
        
        XCTAssertEqual(view.allSubviews.count, 0)
        XCTAssertEqual(otherView.allSubviews.count, 0)
        XCTAssertEqual(viewWithoutSwitch.allSubviews.count, 0)
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
        
        XCTAssertEqual(innerView.constraints.count, 2)
        XCTAssertEqual(stack.constraints.count, 2)
    }
}
