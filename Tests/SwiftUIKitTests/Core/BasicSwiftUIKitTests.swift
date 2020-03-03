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
    
    static var allTests = [
        ("testEmbedView", testEmbedView),
        ("testVStackView", testVStackView),
        ("testHStackView", testHStackView),
        ("testZStackView", testZStackView),
        ("testPaddingView", testPaddingView)
    ]
}
