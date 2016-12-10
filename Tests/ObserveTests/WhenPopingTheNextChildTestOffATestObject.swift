//
//  WhenPopingTheNextChildTestOffATestObject.swift
//  Observe
//
//  Created by Sam Meech-Ward on 2016-12-09.
//
//
@testable import Observe
import XCTest

class WhenPopingTheNextChildTestOffATestObject: XCTestCase {

    var observeTest: ObserveTest!
    var childTest1: ObserveTest!
    var childTest2: ObserveTest!
    var childTest3: ObserveTest!
    var children = [ObserveTest]()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        observeTest = ObserveTest()
        childTest1 = ObserveTest()
        childTest2 = ObserveTest()
        childTest3 = ObserveTest()
        observeTest.addChild(test: childTest1)
        observeTest.addChild(test: childTest2)
        observeTest.addChild(test: childTest3)
        
        children = [childTest1, childTest2, childTest3]
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_popNextChild_removesChildrenInOrder() {
        XCTAssertTrue(arraysAreEqual(observeTest.children as! [ObserveTest], children))
        
        _ = observeTest.popNextChild()
        children.remove(at: 0)
        
        XCTAssertTrue(arraysAreEqual(observeTest.children as! [ObserveTest], children))
        
        _ = observeTest.popNextChild()
        children.remove(at: 0)
        
        XCTAssertTrue(arraysAreEqual(observeTest.children as! [ObserveTest], children))
        
        _ = observeTest.popNextChild()
        children.remove(at: 0)
        
        XCTAssertTrue(arraysAreEqual(observeTest.children as! [ObserveTest], children))
    }
    
    
    
    func test_popNextChild_returnsTheChildItRemoves() {
        let child1 = observeTest.popNextChild() as! ObserveTest
        XCTAssertTrue(child1 === childTest1)
        
        let child2 = observeTest.popNextChild() as! ObserveTest
        XCTAssertTrue(child2 === childTest2)
        
        let child3 = observeTest.popNextChild() as! ObserveTest
        XCTAssertTrue(child3 === childTest3)
    }
    
    func test_popNextChild_returnsNilWhenThereAreNoMoreChildren() {
        _ = observeTest.popNextChild() as! ObserveTest
        _ = observeTest.popNextChild() as! ObserveTest
        _ = observeTest.popNextChild() as! ObserveTest
        let child4 = observeTest.popNextChild()
        
        XCTAssertNil(child4)
    }
    
    
    // Mark: Helpers
    
    func arraysAreEqual(_ array1: [ObserveTest], _ array2: [ObserveTest]) -> Bool {
        guard array1.count == array2.count else {
            return false
        }
        
        for (index, object1) in array1.enumerated() {
            let object2 = array2[index]
            
            if object1 !== object2 {
                return false
            }
        }
        
        return true
    }
    
}
