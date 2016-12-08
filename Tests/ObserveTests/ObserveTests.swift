import XCTest
@testable import Observe


class ObserveTests: XCTestCase {
    
    override func setUp() {
        TestDependencies.failureHandler = XCTFail
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(Observe().text, "Hello, World!")

    }
    
    func testSomething() {
        given("I have something") {
            
            when("I do something") {
                
                then("Something should happen") {
                    
                    expectTrue(true)
                    
                }
            }
        }
    }
    
    func testSomethingElse() {
        given("I have something else") {
            
            when("I do something else") {
                
                then("Something else should happen") {
                    
                    expectTrue(false)
                    
                }
            }
        }
    }

}
