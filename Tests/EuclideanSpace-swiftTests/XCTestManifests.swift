import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(EuclideanSpace_swiftTests.allTests),
    ]
}
#endif
