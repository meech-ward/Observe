import XCTest
@testable import Observe


class ObserveTests: XCTestCase {
    
    override func setUp() {
    }
    
    /// Test that each describe method get's called in the order that it was written.
    func testDescribesGetCalledInOrder() {
        var tests = [Int]()
        describe("test1") {
            tests.append(1)
            describe("") {
                tests.append(2)
                describe("") {
                    tests.append(3)
                }
            }
            describe("") {
                tests.append(4)
            }
        }
        XCTAssertEqual(tests, [1,2,3,4])
    }
}
