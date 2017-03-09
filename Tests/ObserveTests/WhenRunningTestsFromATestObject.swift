//
//  WhenRunningTestsFromATestObject.swift
//  Observe
//
//  Created by Sam Meech-Ward on 2016-12-09.
//
//

@testable import Observe
import XCTest

class WhenRunningTestsFromATestObject: XCTestCase {

    var observeTest: ObserveTest!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        observeTest = ObserveTest()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func test_runTest_runsTheTestClosure() {
        var run = false
        observeTest.closure = {
            run = true
        }
        
        observeTest.runTest()
    
        XCTAssertTrue(run)
    }
    
    func test_runTest_updatesRunningProperties() {
        observeTest.closure = {
            XCTAssertTrue(self.observeTest.running)
        }
        
        XCTAssertFalse(observeTest.running)
        observeTest.runTest()
        XCTAssertFalse(observeTest.running)
    }
    
    func test_runTest_updatesTestedProperty() {
        XCTAssertFalse(observeTest.tested)
        observeTest.runTest()
        XCTAssertTrue(observeTest.tested)
    }

}
