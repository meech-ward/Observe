//
//  WhenLoggingOutput.swift
//  Observe
//
//  Created by Sam Meech-Ward on 2017-03-01.
//
//
import Observe
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
    
    func didRunBlock(file: StaticString, method: String, line: UInt, message: String, blockType: BlockType, indentationLevel: Int) {
        
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
    
    func test_describe_triggers_willRun() {
        describe("") {
        }
        
        assertTestReporterPropertiesAreSet(reporter: self.reporter)
    }
    
    func test_describe_triggers_willRun_withCorrectParameters() {
        let methodName = "test_describe_triggers_willRun_withCorrectParameters()"
        
        let message1 = "some text"
        describe(message1) {
            
        }
        
        XCTAssertEqual(reporter?.message, message1)
        XCTAssertEqual(reporter?.method, methodName)
        XCTAssertEqual(reporter?.blockType, .describe)
    }
    
    func test_describe_triggers_willRun_withCorrectIndentationLevels() {
        let message1 = "some text"
        let message2 = "some text 2"
        let message3 = "some text 3"
        describe(message1) {
            XCTAssertEqual(self.reporter?.message, message1)
            XCTAssertEqual(self.reporter?.indentationLevel, 0)
            describe(message2) {
                XCTAssertEqual(self.reporter?.message, message2)
                XCTAssertEqual(self.reporter?.indentationLevel, 1)
                describe(message3) {
                    XCTAssertEqual(self.reporter?.message, message3)
                    XCTAssertEqual(self.reporter?.indentationLevel, 2)
                }
            }
        }
    }
    
    func test_describe_triggers_didRun() {
        let string = "some text"
        describe(string) {
            self.reporter = TestReporter()
            Observe.reporterDelegate = self.reporter!
        }
        
        assertTestReporterPropertiesAreSet(reporter: self.reporter)
    }
    
}
