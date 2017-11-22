//
//  BDDFunctions.swift
//  Observe
//
//  Created by Sam Meech-Ward on 2017-03-01.
//
//

import Foundation

/**
 Responsible for creating the new test type and adding it to the tree structure.
 
 - parameter message: The message passed into the function.
 - parameter blockType: The type of function that was called `BlockType`.
 - parameter file: The file the function is called from.
 - parameter line: The line number in that file that the function is called from.
 - parameter method: The method in that file that the function is called from.
 - parameter handler: The logic that will get exectued.
 */
private func addTestBlock(_ message: String, blockType: BlockType, file: StaticString = #file, line: UInt = #line, method: String = #function, handler: @escaping (() -> (Void))) {
    
    let test = ObserveTest(closure: handler, file: file, method: method, line: line, message: message, blockType: blockType)
    
    if var currentTest = Observe.currentTest {
        currentTest.add(childTest: test)
    } else {
        Observe.currentTest = test
    }
    
    Observe.runTests()
}

public func describe(_ message: String, file: StaticString = #file, line: UInt = #line, method: String = #function, handler: @escaping (() -> (Void))) {
    addTestBlock(message, blockType: .describe, file: file, line: line, method: method, handler: handler)
}

public func context(_ message: String, file: StaticString = #file, line: UInt = #line, method: String = #function, handler: @escaping (() -> (Void))) {
    addTestBlock(message, blockType: .context, file: file, line: line, method: method, handler: handler)
}

public func it(_ message: String, file: StaticString = #file, line: UInt = #line, method: String = #function, handler: @escaping (() -> (Void))) {
    addTestBlock(message, blockType: .it, file: file, line: line, method: method, handler: handler)
}

public func given(_ message: String, file: StaticString = #file, line: UInt = #line, method: String = #function, handler: @escaping (() -> (Void))) {
    addTestBlock(message, blockType: .given, file: file, line: line, method: method, handler: handler)
}

public func when(_ message: String, file: StaticString = #file, line: UInt = #line, method: String = #function, handler: @escaping (() -> (Void))) {
    addTestBlock(message, blockType: .when, file: file, line: line, method: method, handler: handler)
}

public func then(_ message: String, file: StaticString = #file, line: UInt = #line, method: String = #function, handler: @escaping (() -> (Void))) {
    addTestBlock(message, blockType: .then, file: file, line: line, method: method, handler: handler)
}

public func and(_ message: String, file: StaticString = #file, line: UInt = #line, method: String = #function, handler: @escaping (() -> (Void))) {
    addTestBlock(message, blockType: .and, file: file, line: line, method: method, handler: handler)
}


/**
 Called before each of the blocks within the same scope.
 */
public func beforeEach(file: StaticString = #file, line: UInt = #line, handler: @escaping (() -> (Void))) {
    guard var currentTest = Observe.currentTest else {
        print("🖕🏼Error: beforeEach must go inside a function")
        return
    }
    
    currentTest.add(beforeEachChild: handler)
}
