import XCTest
@testable import WireGuardKit

final class WireGuardKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(WireGuardKit().text, "Hello, World!")

        printWireGuardKitVersion()
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
