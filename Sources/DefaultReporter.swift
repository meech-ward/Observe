//
//  DefaultReporter.swift
//  Focus
//
//  Created by Sam Meech-Ward on 2017-03-20.
//
//

import Foundation

public class DefaultReporter: Reportable {
    
    private init() {
    }
    
    public static let sharedReporter = DefaultReporter()
    
    public func willRunBlock(file: StaticString, method: String, line: UInt, message: String, blockType: BlockType, indentationLevel: Int) {
        printWithIndentation(file: file, method: method, line: line, message: message, blockType: blockTypeString(blockType: blockType), indentationLevel: indentationLevel)
    }
    
    public func didRunBlock(file: StaticString, method: String, line: UInt, message: String, blockType: BlockType, indentationLevel: Int) {
        
    }
    
    private func blockTypeString(blockType: BlockType) -> String {
        switch blockType {
        case .given:
            return "Given"
        case .when:
            return "When"
        case .then:
            return "Then"
        case .and:
            return "And"
        default:
            return ""
        }
    }
}

// MARK: Print
extension DefaultReporter {
    func printWithIndentation(file: StaticString, method: String, line: UInt, message: String, blockType: String, indentationLevel: Int) {
        if indentationLevel == 0 {
            print("")
            print("\nFile: \(file), Method: \(method)")
        }
        
        var printMessage = ""
        
        for _ in 0...indentationLevel {
            printMessage += "--"
        }
        
        printMessage += "| \(blockType)): "
        
        printMessage += message
        
        print(printMessage)
    }
}
