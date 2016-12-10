//
//  ObserveTestable.swift
//  Observe
//
//  Created by Sam Meech-Ward on 2016-12-09.
//
//

import Foundation

protocol ObserveTestable {
    /// The closure that should be run for the current test.
    var closure: ((Void) -> (Void))? { get set }
    /// The closure that should be run before any child closures get run.
    var beforeEachChild: ((Void) -> (Void))? { get set }
    /// All the direct children of this test.
    var children: [ObserveTestable]? { get }
    /// true if this test is running, false otherwise.
    var running: Bool { get }
    /// true if this test has already been run, false otherwise.
    var tested: Bool { get }
    /// The description of the test.
    var description: String? { get set }
    /// The parent of the current test.
    var parent: ObserveTestable? { get }
    
    /**
     Create a new instance of the Observe Testable.
    */
//    init(closure: ((Void) -> (Void))?, beforeEachChild: ((Void) -> (Void))?)
    
    /**
     Add a child test to this test's children array.
     
     - parameter test: The child test.
     */
    mutating func addChild(test: ObserveTestable)
    
    /**
     Run the current test and adjust the running variable to show the status of this.
     */
    func runTest()
    
    /**
     Run the before each child method
    */
    func runBeforeEachChild()
    
    /**
     Get the next child test from the list of next children and pop that child from the list.
    */
    mutating func popNextChild() -> ObserveTestable?
}

extension ObserveTestable {
    
}
