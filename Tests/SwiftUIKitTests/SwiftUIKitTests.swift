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
    
    static var allTests = [
        ("testLabelADA", testLabelADA),
        ("testButtonADA", testButtonADA)
    ]
}
