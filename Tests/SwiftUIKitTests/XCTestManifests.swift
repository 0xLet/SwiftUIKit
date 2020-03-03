import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(BasicSwiftUIKitTests.allTests),
        testCase(BasicADATests.allTests),
        testCase(NSMutableAttributedStringTests.allTests),
    ]
}
#endif
