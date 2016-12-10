struct Observe {

//    var text = "Hello, World!"
//    
//    static var failureHandler: ((_ message: String, _ file: StaticString, _ line: UInt) -> (Void))?
//    static var successHandler: ((_ message: String, _ file: StaticString, _ line: UInt) -> (Void))?
//    
    
    static var currentTest: ObserveTestable?
    
    static func runTests() {
        guard var currentTest = currentTest else {
            //        print("🖕🏼Error: There should be a test to run")
            print("No more tests to run")
            return
        }
        
        guard currentTest.running == false else {
            print("Already Running")
            return
        }
        
        if currentTest.tested == false {
            currentTest.runTest()
            
            // Run the before, not before each, here
        }
        
        let beforeEachChild = currentTest.runBeforeEachChild
        
        if let nextChild = currentTest.popNextChild() {
            self.currentTest = nextChild
            beforeEachChild()
        } else {
            self.currentTest = currentTest.parent
        }
        
        runTests()
    }
}

func describe(_ message: String, file: StaticString = #file, line: UInt = #line, handler: @escaping ((Void) -> (Void))) {
    let test = ObserveTest()
    test.closure = handler
    test.description = message
    
    if var currentTest = Observe.currentTest {
        currentTest.addChild(test: test)
    } else {
        Observe.currentTest = test
    }
//    print("✏️ \(message)")
    Observe.runTests()
}


/**
 Called before each of the blocks within the same scope.
 */
func beforeEach(file: StaticString = #file, line: UInt = #line, handler: @escaping ((Void) -> (Void))) {
    guard var currentTest = Observe.currentTest else {
        print("🖕🏼Error: beforeEach must go inside a function")
        return
    }
    
    currentTest.beforeEachChild = handler
}

