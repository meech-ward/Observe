//
//  ObserveTestable.swift
//  Observe
//
//  Created by Sam Meech-Ward on 2016-12-09.
//
//

import Foundation

protocol ObserveTestable {
    /// All the direct children of this test.
    var children: [ObserveTestable]? { get }
    /// true if this test is running, false otherwise.
    var running: Bool { get }
    /// true if this test has already been run, false otherwise.
    var tested: Bool { get }
    /// The parent of the current test.
    var parent: ObserveTestable? { get }

    
    /**
     Run the current test and adjust the running variable to show the status of this.
     */
    func runTest()
    
    /**
     Run the before each child method
    */
    func runBeforeEachChild()
    
    // MARK: Mutating
    
    /**
     Add a child test to this test's children array.
     This will also add the current test as the child's parent.
     
     - parameter test: The child test.
     */
    mutating func add(childTest test: ObserveTestable)
    
    /**
     Get the next child test from the list of next children and pop that child from the list.
     */
    mutating func popNextChild() -> ObserveTestable?
    
    /**
     Set the closure that will be run before each of the test's children
    */
    mutating func add(beforeEachChild child: ((Void) -> (Void))?)
    

}

extension ObserveTestable {
    
}
