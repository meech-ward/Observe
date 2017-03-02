//
//  WhenLoggingOutput.swift
//  Observe
//
//  Created by Sam Meech-Ward on 2017-03-01.
//
//
@testable import Observe
import XCTest

class TestReporter: ReporterDelegate {
    
    var file: String?
    var method: String?
    var line: UInt?
    var message: String?
    var blockType: BlockType?
    var indentationLevel: Int?
    
    func willRunBlock(file: StaticString, method: String, line: UInt, message: String, blockType: BlockType, indentationLevel: Int) {
        
        self.file = String(describing: file)
        self.method = method
        self.line = line
        self.message = message
        self.blockType = blockType
        self.indentationLevel = indentationLevel
    }
    
}

class WhenLoggingOutput: XCTestCase {
    
    var reporter: TestReporter?
    
    override func setUp() {
        super.setUp()
        
        self.reporter = TestReporter()
        Observe.reporterDelegate = reporter!
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func assertTestReporterPropertiesAreSet(reporter: TestReporter?) {
        guard let reporter = reporter else {
            XCTFail("reporter is nil")
            return
        }
        XCTAssertNotNil(reporter.file)
        XCTAssertNotNil(reporter.method)
        XCTAssertNotNil(reporter.line)
        XCTAssertNotNil(reporter.message)
        XCTAssertNotNil(reporter.blockType)
        XCTAssertNotNil(reporter.indentationLevel)
    }
    
    func test_describeWillRunGetsCalled() {
        let string = "some text"
        given(string) {
            
        }
        
        assertTestReporterPropertiesAreSet(reporter: self.reporter)
    }
    
}
