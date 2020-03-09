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
    
    func testDefaultView() {
        
        let view = View()
        
        XCTAssert(view.backgroundColor == .clear)
        XCTAssert(view.allSubviews.count == 0)
        XCTAssert(view.constraints.count == 0)
    }
    
    func testEmbedView() {
        
        let view = View()
        
        let viewToEmbed = View()
        
        view.embed {
            viewToEmbed
        }
        
        XCTAssert(view.backgroundColor == .clear)
        XCTAssert(view.allSubviews.count == 1)
        XCTAssert(view.constraints.count == 4)
    }
    
    func testEmbedViews() {
        
        let view = View()
        
        let viewToEmbed = View()
        
        view.embed {
            viewToEmbed.embed {
                View()
            }
        }
        
        XCTAssert(view.backgroundColor == .clear)
        XCTAssert(view.allSubviews.count == 2)
        XCTAssert(view.constraints.count == 4)
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
        
        let view = View().embed {
            View().vstack {
                [
                    Image(.blue),
                    Switch()
                ]
            }
        }
        
        let otherView = View().embed {
            VStack {
                [
                    Image(.blue),
                    Switch()
                ]
            }
        }
        
        let viewWithoutSwitch = View().embed {
            View().vstack {
                [
                    Image(.blue)
                ]
            }
        }
        
        XCTAssert(switchView.allSubviews.count == 8, "switchView.allSubviews.count == \(switchView.allSubviews.count)")
        XCTAssert(uiSwitchView.allSubviews.count == 8, "uiSwitchView.allSubviews.count == \(uiSwitchView.allSubviews.count)")
        
        XCTAssert(view.allSubviews.count == 12, "view.allSubviews.count == \(view.allSubviews.count)")
        XCTAssert(otherView.allSubviews.count == 12, "otherView.allSubviews.count == \(otherView.allSubviews.count)")
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
        ("testClearView", testClearView)
    ]
}
