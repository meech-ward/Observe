/**
 Responsible for the executions of the tests.
 */
struct Observe {
    
    public static var reporter: Reportable? = DefaultReporter.sharedReporter
    
    static var currentTest: ObserveTestable?
    
    static func runTests() {
        guard let currentTest = currentTest else {
            // No more tests to run
            return
        }
        
        guard currentTest.running == false else {
            // Already Running
            return
        }
        
        if currentTest.tested == false {
            currentTest.runTest()
            
            // TODO: Run the before, not before each, here
        }
        
        self.currentTest = nextTestInLine()
        
        runTests()
    }
    
    /**
     Get the next child test in line and remove it from the line.
     If there are no more children tests, return the parent test.
     If there is a child test, run the `beforeEach()` method before returning.
    */
    private static func nextTestInLine() -> ObserveTestable? {
        var test: ObserveTestable?
        
        if let nextChild = currentTest?.popNextChild() {
            test = nextChild
            currentTest?.runBeforeEachChild()
        } else {
            test = currentTest?.parent
        }
        
        return test
    }
}

public func set(reporter: Reportable) {
    Observe.reporter = reporter
}
