//
//  ObserveTest.swift
//  Observe
//
//  Created by Sam Meech-Ward on 2016-12-09.
//
//

import Foundation

class ObserveTest: ObserveTestable {
    private let closure: (() -> (Void))?
    private let file: StaticString?
    private let method: String?
    private let line: UInt?
    private let message: String?
    private let blockType: BlockType?
    
    init(closure: (() -> (Void))? = nil, file: StaticString? = nil, method: String? = nil, line: UInt? = nil, message: String? = nil, blockType: BlockType? = nil) {
        self.closure = closure
        self.file = file
        self.method = method
        self.line = line
        self.message = message
        self.blockType = blockType
    }
    
    private var reporter: Reportable? {
        return Observe.reporter
    }
    
    // MARK: Parent
    
    private var _parent: ObserveTestable?
    
    var parent: ObserveTestable? {
        return _parent
    }
    
    private var numberOfParents: Int {
        var number = 0
        var parent = self.parent
        while parent != nil {
            number += 1
            parent = parent?.parent
        }
        return number
    }
    
    // MARK: Children
    
    private var _children: [ObserveTestable]?
    
    var children: [ObserveTestable]? {
        return _children
    }
    
    
    func add(childTest test: ObserveTestable) {
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
    
    // MARK: Before & After
    
    private var beforeEachChild: (() -> (Void))?
    
    func add(beforeEachChild child: (() -> (Void))?) {
        beforeEachChild = child
    }
    
    // MARK: Run 
    
    private var _running = false
    private var _tested = false
    
    var running: Bool {
        return _running
    }
    var tested: Bool {
        return _tested
    }
    
    func runBeforeEachChild() {
        beforeEachChild?()
    }
    
    func runTest() {
        _running = true
        reporter?.willRunBlock(file: file ?? "", method: method ?? "", line: line ?? 0, message: message ?? "", blockType: blockType ?? .none, indentationLevel: numberOfParents)
        closure?()
        _running = false
        _tested = true
        reporter?.didRunBlock(file: file ?? "", method: method ?? "", line: line ?? 0, message: message ?? "", blockType: blockType ?? .none, indentationLevel: numberOfParents)
    }
}
