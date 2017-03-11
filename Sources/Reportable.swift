//
//  Reportable.swift
//  Observe
//
//  Created by Sam Meech-Ward on 2017-03-01.
//
//

import Foundation

public protocol Reportable {
    
    func willRunBlock(file: StaticString, method: String, line: UInt, message: String, blockType: BlockType, indentationLevel: Int)
    
    func didRunBlock(file: StaticString, method: String, line: UInt, message: String, blockType: BlockType, indentationLevel: Int)
    
}
