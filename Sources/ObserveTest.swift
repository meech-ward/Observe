//
//  ObserveTest.swift
//  Observe
//
//  Created by Sam Meech-Ward on 2016-12-09.
//
//

import Foundation

class ObserveTest: ObserveTestable {
    var closure: ((Void) -> (Void))?
    var beforeEachChild: ((Void) -> (Void))?
    var description: String?
    
    var children: [ObserveTestable]? {
        return _children
    }
    private var _children: [ObserveTestable]?
    
    var running: Bool {
        return _running
    }
    private var _running = false
    
    var tested: Bool {
        return _tested
    }
    private var _tested = false
    
    var parent: ObserveTestable? {
        return _parent
    }
    private var _parent: ObserveTestable?
    
    func addChild(test: ObserveTestable) {
        if _children == nil {
            _children = []
        }
        _children?.append(test)
        (test as! ObserveTest)._parent = self
    }
    
    func popNextChild() -> ObserveTestable? {
        guard _children?.isEmpty == false else {
            return nil
        }
        
        return _children?.remove(at: 0)
    }
    
    func runBeforeEachChild() {
        beforeEachChild?()
    }
    
    func runTest() {
        _running = true
        print("✏️ \(description)")
        closure?()
        _running = false
        _tested = true
    }
}
