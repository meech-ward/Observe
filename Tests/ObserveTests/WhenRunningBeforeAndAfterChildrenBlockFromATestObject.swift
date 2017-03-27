//
//  WhenRunningBeforeAndAfterChildrenBlockFromATestObject.swift
//  Observe
//
//  Created by Sam Meech-Ward on 2016-12-09.
//
//

@testable import Observe
import XCTest

class WhenRunningBeforeAndAfterChildrenBlockFromATestObject: XCTestCase {

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

    func test_runBeforeEachChild() {
        
    }
    
    func test_runBeforeEachChild_runsTheClosure() {
        var run = false
        observeTest.add(beforeEachChild: {
            run = true
        })
        
        observeTest.runBeforeEachChild()
        
        XCTAssertTrue(run)
    }
}
