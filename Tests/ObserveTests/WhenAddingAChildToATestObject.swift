//
//  WhenUsingAnObserveTestObject.swift
//  Observe
//
//  Created by Sam Meech-Ward on 2016-12-09.
//
//
@testable import Observe
import XCTest

class WhenAddingAChildToATestObject: XCTestCase {

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

    func test_addChild_addsATestAsAChild() {
        let childTest = ObserveTest()
        observeTest.add(childTest: childTest)
        
        XCTAssert(observeTest.children?.isEmpty == false)
        
        guard let test = observeTest.children?[0] as? ObserveTest else {
            XCTFail("Test was not added at 0 index")
            return
        }
        
        XCTAssertTrue(test === childTest)
    }
    
    func test_addChild_addsAManyTestsAsAChildrenInorder() {
        let childTest1 = ObserveTest()
        let childTest2 = ObserveTest()
        observeTest.add(childTest: childTest1)
        observeTest.add(childTest: childTest2)
        
        XCTAssert(observeTest.children?.isEmpty == false)
        
        guard let test1 = observeTest.children?[0] as? ObserveTest else {
            XCTFail("Test was not added at 0 index")
            return
        }
        
        XCTAssertTrue(test1 === childTest1)
        
        guard let test2 = observeTest.children?[1] as? ObserveTest else {
            XCTFail("Test was not added at 0 index")
            return
        }
        
        XCTAssertTrue(test2 === childTest2)
    }
    
    func test_addChild_addsParentToChild() {
        let childTest = ObserveTest()
        observeTest.add(childTest: childTest)
        
        guard let parent = childTest.parent as? ObserveTest else {
            XCTFail("parent not added to child test")
            return
        }
        XCTAssertTrue(parent === observeTest)
    }

}
