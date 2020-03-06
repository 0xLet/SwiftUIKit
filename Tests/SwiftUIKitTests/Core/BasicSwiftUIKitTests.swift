//
//  BasicSwiftUIKitTests.swift
//  
//
//  Created by Zach Eriksen on 3/2/20.
//

import Foundation
import XCTest
@testable import SwiftUIKit

@available(iOS 9.0, *)
final class BasicSwiftUIKitTests: XCTestCase {
    func testEmbedView() {
        
        let view = View()
        
        let viewToEmbed = View()
        
        view.embed {
            viewToEmbed
        }
        
        XCTAssert(view.allSubviews.count == 1)
    }
    
    func testVStackView() {
        
        let viewToEmbed = View()
        
        let stack = VStack {
            [
                viewToEmbed
            ]
        }
        
        XCTAssert(stack.subviews.first.map { type(of: $0) } == UIStackView.self)
        XCTAssert(stack.allSubviews.count == 2)
    }
    
    func testHStackView() {
        
        let viewToEmbed = View()
        
        let stack = HStack {
            [
                viewToEmbed
            ]
        }
        
        XCTAssert(stack.subviews.first.map { type(of: $0) } == UIStackView.self)
        XCTAssert(stack.allSubviews.count == 2)
    }
    
    func testZStackView() {
        
        let viewToEmbed = View()
        
        let stack = ZStack {
            [
                viewToEmbed
            ]
        }
        
        XCTAssert(stack.allSubviews.count == 1)
    }
    
    func testPaddingView() {
        
        let view = View().padding()
        
        XCTAssert(view.allSubviews.count == 1)
    }
    
    func testConfigureView() {
        
        let view = View(backgroundColor: .red)
            .configure {
                $0.backgroundColor = .blue
                $0.isHidden = true
                $0.tintColor = .green
                $0.clipsToBounds = true
        }
        
        let otherView = View(backgroundColor: .blue)
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
        
        let view = View()
            .layer {
            $0.borderColor = UIColor.blue.cgColor
            $0.borderWidth = 3
            $0.cornerRadius = 8
            $0.masksToBounds = true
        }
        
        let otherView = View()
            .corner(radius: 8)
        
        XCTAssert(view.layer.borderColor == UIColor.blue.cgColor)
        XCTAssert(view.layer.borderWidth == 3)
        XCTAssert(view.layer.cornerRadius == 8)
        XCTAssert(view.layer.masksToBounds == true)
        
        XCTAssert(view.layer.cornerRadius == otherView.layer.cornerRadius)
    }
    
    static var allTests = [
        ("testEmbedView", testEmbedView),
        ("testVStackView", testVStackView),
        ("testHStackView", testHStackView),
        ("testZStackView", testZStackView),
        ("testPaddingView", testPaddingView),
        ("testConfigureView", testConfigureView),
        ("testLayerView", testLayerView)
    ]
}
