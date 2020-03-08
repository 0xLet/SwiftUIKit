//
//  UIView+SwiftUIKitTests.swift
//  SwiftUIKitTests
//
//  Created by Oskar on 06/03/2020.
//

import XCTest
@testable import SwiftUIKit

@available(iOS 9.0, *)
class CALayer_SwiftUIKitTests: XCTestCase {
  private var label: Label!
  
  private let testColor = UIColor.red.cgColor
  private let testCGFloat: CGFloat = 0.5
  private let testDouble = 0.5
  private let testCGRect = CGRect(x: 10.0, y: 20.0, width: 200.0, height: 200.0)
  private let testKey = "test"
  
  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    label = nil
    super.tearDown()
  }
  
  func setUpLabel(testing name: String) -> Label {
    label = Label("Testing: \(name)")
    return label
  }
  
  func testView_layerModifier_borderColor() {
    setUpLabel(testing: "borderColor")
      .layer(borderColor: testColor)
    
    XCTAssertEqual(label.layer.borderColor, testColor)
  }
  
  func testView_layerModifier_borderWidth() {
    setUpLabel(testing: "borderWidth")
      .layer(borderWidth: testCGFloat)
    
    XCTAssertEqual(label.layer.borderWidth, testCGFloat)
  }
  
  func testView_layerModifier_opacity() {
    setUpLabel(testing: "opacity")
      .layer(opacity: testDouble)
    
    XCTAssertEqual(label.layer.opacity, Float(testDouble))
  }
  
  func testView_layerModifier_contentsGravity() {
    let testGravity: CALayerContentsGravity = .center
    
    setUpLabel(testing: "contentsGravity")
      .layer(contentsGravity: testGravity)
    
    XCTAssertEqual(label.layer.contentsGravity, testGravity)
  }
  
  func testView_layerModifier_isHidden() {
    setUpLabel(testing: "layer's isHidden")
      .layer(isHidden: true)
    
    XCTAssertTrue(label.layer.isHidden)
  }
  
  func testView_layerModifier_masksToBounds() {
    setUpLabel(testing: "masksToBounds")
      .layer(masksToBounds: true)
    
    XCTAssertTrue(label.layer.masksToBounds)
  }
  
  func testView_layerModifier_mask() {
    let testMask = CALayer()
    
    setUpLabel(testing: "mask")
      .layer(mask: testMask)
    
    XCTAssertEqual(label.layer.mask, testMask)
  }
  
  func testView_layerModifier_doubleSided() {
    setUpLabel(testing: "isDoubleSided")
      .layer(isDoubleSided: true)
    
    XCTAssertTrue(label.layer.isDoubleSided)
  }
  
  @available(iOS 11.0, *)
  func testView_layerModifier_maskedCorners() {
    let testCornerMask = CACornerMask()
    
    setUpLabel(testing: "maskedCorners")
      .layer(maskedCorners: testCornerMask)
    
    XCTAssertEqual(label.layer.maskedCorners, testCornerMask)
  }
  
  func testView_layerModifier_shadowOpacity() {
    setUpLabel(testing: "shadowOpacity")
      .layer(shadowOpacity: testDouble)
    
    XCTAssertEqual(label.layer.shadowOpacity, Float(testDouble))
  }
  
  func testView_layerModifier_shadowRadius() {
    setUpLabel(testing: "shadowRadius")
      .layer(shadowRadius: testDouble)
    
    XCTAssertEqual(label.layer.shadowRadius, CGFloat(testDouble))
  }
  
  func testView_layerModifier_shadowOffset() {
    let testShadowOffset = CGSize(width: 200, height: 200)
    
    setUpLabel(testing: "shadowOffset")
      .layer(shadowOffset: testShadowOffset)
    
    XCTAssertEqual(label.layer.shadowOffset, testShadowOffset)
  }
  
  func testView_layerModifier_shadowPath() {
    let testPath = CGPath(roundedRect: .infinite, cornerWidth: 2, cornerHeight: 5, transform: nil)
    
    setUpLabel(testing: "shadowPath")
      .layer(shadowPath: testPath)
    
    XCTAssertEqual(label.layer.shadowPath, testPath)
  }
  
  
  func testView_layerModifier_allowsEdgeAntialiasing() {
    setUpLabel(testing: "allowsEdgeAntialiasing")
      .layer(allowsEdgeAntialiasing: true)
    
    XCTAssertTrue(label.layer.allowsEdgeAntialiasing)
  }
  
  func testView_layerModifier_allowsGroupOpacity() {
    setUpLabel(testing: "allowsGroupOpacity")
      .layer(allowsGroupOpacity: true)
    
    XCTAssertTrue(label.layer.allowsGroupOpacity)
  }
  
  func testView_layerModifier_style() {
    let testDict = [0: "Test"]
    
    setUpLabel(testing: "style")
      .layer(style: testDict)
    
    XCTAssertEqual(label.layer.style?.first?.value as? String,
                   testDict[0])
  }
  
  func testView_layerModifier_filter() {
    let testFilters = [CIFilter(name: "CIGaussianBlur")]
    
    setUpLabel(testing: "Filters")
      .layer(filters: testFilters as [Any])
    
    let layers = label.layer.filters as! [CIFilter]
    XCTAssertEqual(layers, testFilters)
  }
  
  func testView_layerModifier_addAnimation() {
    let testAnimation = CABasicAnimation(keyPath: "addAnimation")
    testAnimation.beginTime = CACurrentMediaTime() + 0.2
    testAnimation.duration = 0.5
    testAnimation.fromValue = 0.0
    testAnimation.toValue = 1.0
    
    
    setUpLabel(testing: "opacity")
      .layer(addAnimation: testAnimation, forKey: testKey)
    
    XCTAssertEqual(label.layer.animation(forKey: testKey)?.beginTime,
                   (testAnimation as CABasicAnimation?)?.beginTime)
  }
  
  func testView_layerModifier_removeAnimation() {
    let testAnimation = CABasicAnimation(keyPath: "opacity")
    testAnimation.beginTime = CACurrentMediaTime() + 0.2
    testAnimation.duration = 0.5
    testAnimation.fromValue = 0.0
    testAnimation.toValue = 1.0
    
    setUpLabel(testing: "removingAnimation")
      .layer(addAnimation: testAnimation, forKey: testKey)
      .layer(removeAnimationForKey: testKey)
    
    XCTAssertNil(label.layer.animation(forKey: "test"))
  }
  
  func testView_layerModifier_removeAllAnimations() {
    let testAnimation = CABasicAnimation(keyPath: "opacity")
    testAnimation.beginTime = CACurrentMediaTime() + 0.2
    testAnimation.duration = 0.5
    testAnimation.fromValue = 0.0
    testAnimation.toValue = 1.0
    
    setUpLabel(testing: "removeAllAnimations")
      .layer(addAnimation: testAnimation, forKey: testKey)
      .removeAllAnimationsFromLayer()
    
    XCTAssertNil(label.layer.animationKeys())
  }
}
