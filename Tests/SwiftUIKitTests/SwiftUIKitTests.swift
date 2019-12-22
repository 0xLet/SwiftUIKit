import XCTest
@testable import SwiftUIKit

@available(iOS 9.0, *)
final class SwiftUIKitTests: XCTestCase {
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
    
    func testAttributedString() {
        var usernameAttributes = StringAttributes(for: .font, value: UIFont.preferredFont(forTextStyle: .headline))
        usernameAttributes.add(key: .foregroundColor, value: UIColor.red)
        let captionAttributes = StringAttributes {
            [
                .font: UIFont.preferredFont(forTextStyle: .caption1),
                .foregroundColor: UIColor.darkGray
            ]
        }
        let caption = AttributedString(string: "oneleif is a project based group focused on learning and mentorship. Our core tenet of becoming skilled professionals is to work on open source projects. Open source simply means the work you are doing is available to the public. This comes with the benefit that anyone can help you on your project, and allows those without experience to see how something is made.", attributes: captionAttributes)
        
        caption.set(attributes: usernameAttributes, range: 0 ... 4)
        
        let label = Label(caption)
            .number(ofLines: 3)
        
        let old_usernameAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline),
                                      NSAttributedString.Key.foregroundColor: UIColor.red]
        let old_captionAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .caption1),
                                     NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        
        let old_caption = NSMutableAttributedString(string: "oneleif is a project based group focused on learning and mentorship. Our core tenet of becoming skilled professionals is to work on open source projects. Open source simply means the work you are doing is available to the public. This comes with the benefit that anyone can help you on your project, and allows those without experience to see how something is made.", attributes: old_captionAttributes)
        
        old_caption.setAttributes(old_usernameAttributes, range: NSRange(location: 0, length: 4))
        
        let old_label = Label(old_caption)
            .number(ofLines: 3)
        
        XCTAssert(label.attributedText == old_label.attributedText)
        XCTAssert(label.text == old_label.text)
        XCTAssert(label.accessibilityLabel == old_label.accessibilityLabel)
        
        XCTAssert(!(label.text?.isEmpty ?? true))
        XCTAssert(!(label.accessibilityLabel?.isEmpty ?? true))
    }
    
    func testApplyLabel() {
        var usernameAttributes = StringAttributes(for: .font, value: UIFont.preferredFont(forTextStyle: .headline))
        usernameAttributes.add(key: .foregroundColor, value: UIColor.red)
        let captionAttributes = StringAttributes {
            [
                .font: UIFont.preferredFont(forTextStyle: .caption1),
                .foregroundColor: UIColor.darkGray
            ]
        }
        let caption = AttributedString(string: "oneleif is a project based group focused on learning and mentorship. Our core tenet of becoming skilled professionals is to work on open source projects. Open source simply means the work you are doing is available to the public. This comes with the benefit that anyone can help you on your project, and allows those without experience to see how something is made.", attributes: captionAttributes)
        
        caption.set(attributes: usernameAttributes, range: 0 ... 4)
        
        let initLabel = Label(caption)
            .number(ofLines: 3)
        let applyLabel = Label("oneleif is a project based group focused on learning and mentorship. Our core tenet of becoming skilled professionals is to work on open source projects. Open source simply means the work you are doing is available to the public. This comes with the benefit that anyone can help you on your project, and allows those without experience to see how something is made.")
            .apply(attributes: captionAttributes)
            .apply(attributes: usernameAttributes, range: 0 ... 4)
        
        XCTAssert(initLabel.attributedText == applyLabel.attributedText)
        XCTAssert(initLabel.text == applyLabel.text)
        XCTAssert(initLabel.accessibilityLabel == applyLabel.accessibilityLabel)
        
        XCTAssert(!(applyLabel.text?.isEmpty ?? true))
        XCTAssert(!(applyLabel.accessibilityLabel?.isEmpty ?? true))
    }
    
    static var allTests = [
        ("testLabelADA", testLabelADA),
        ("testButtonADA", testButtonADA),
        ("testAttributedString", testAttributedString),
        ("testApplyLabel", testApplyLabel)
    ]
}
