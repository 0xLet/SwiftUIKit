//
//  ContainerViewTests.swift
//  SwiftUIKitTests
//
//  Created by Zach Eriksen on 5/17/20.
//

import XCTest
import UIKit
import SwiftUIKit

@available(iOS 9.0, *)
class ContainerViewTests: XCTestCase {
    
    func testBasicContainerView() {
        let mainVC = UIViewController()
        let someVC = UIViewController()
        let containerView = ContainerView(parent: mainVC) {
            someVC
        }
        
        XCTAssertEqual(mainVC.children.count, 1)
        XCTAssertEqual(someVC.children.count, 0)
        XCTAssertEqual(mainVC.view.allSubviews.count, 0)
        XCTAssertEqual(someVC.view.allSubviews.count, 0)
        XCTAssertEqual(containerView.allSubviews.count, 1)
    }
    
    func testEmbedContainerView() {
        let mainVC = UIViewController()
        let someVC = UIViewController()
        let containerView = ContainerView(parent: mainVC) {
            someVC
        }
        
        XCTAssertEqual(mainVC.children.count, 1)
        XCTAssertEqual(someVC.children.count, 0)
        XCTAssertEqual(mainVC.view.allSubviews.count, 0)
        XCTAssertEqual(someVC.view.allSubviews.count, 0)
        XCTAssertEqual(containerView.allSubviews.count, 1)
        
        mainVC.view.embed {
            containerView
        }
        
        XCTAssertEqual(mainVC.children.count, 1)
        XCTAssertEqual(someVC.children.count, 0)
        XCTAssertEqual(mainVC.view.allSubviews.count, 2)
        XCTAssertEqual(someVC.view.allSubviews.count, 0)
        XCTAssertEqual(containerView.allSubviews.count, 1)
    }
    
    func testChildVCEmbedContainerView() {
        let mainVC = UIViewController()
        let someVC = UIViewController()
        let containerView = ContainerView(parent: mainVC) {
            someVC
        }
        
        XCTAssertEqual(mainVC.children.count, 1)
        XCTAssertEqual(someVC.children.count, 0)
        XCTAssertEqual(mainVC.view.allSubviews.count, 0)
        XCTAssertEqual(someVC.view.allSubviews.count, 0)
        XCTAssertEqual(containerView.allSubviews.count, 1)
        
        mainVC.view.embed {
            containerView
        }
        
        XCTAssertEqual(mainVC.children.count, 1)
        XCTAssertEqual(someVC.children.count, 0)
        XCTAssertEqual(mainVC.view.allSubviews.count, 2)
        XCTAssertEqual(someVC.view.allSubviews.count, 0)
        XCTAssertEqual(containerView.allSubviews.count, 1)
        
        someVC.view.embed {
            VStack {
                [
                Label("Something")
                ]
            }
        }
        
        XCTAssertEqual(mainVC.children.count, 1)
        XCTAssertEqual(someVC.children.count, 0)
        XCTAssertEqual(mainVC.view.allSubviews.count, 5)
        XCTAssertEqual(someVC.view.allSubviews.count, 3)
        XCTAssertEqual(containerView.allSubviews.count, 4)
    }
}
