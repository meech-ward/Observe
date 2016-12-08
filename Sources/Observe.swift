struct Observe {

    var text = "Hello, World!"
}

struct TestDependencies {
    static var failureHandler: ((_ message: String, _ file: StaticString, _ line: UInt) -> (Void))?
}

func given(_ message: String, file: StaticString = #file, line: UInt = #line, handler: ((Void) -> (Void))) {
    print("✏️ given \(message)", terminator:"")
    handler()
}
func when(_ message: String, file: StaticString = #file, line: UInt = #line, handler: ((Void) -> (Void))) {
    print(", when \(message)", terminator:"")
    handler()
}
func then(_ message: String, file: StaticString = #file, line: UInt = #line, handler: ((Void) -> (Void))) {
    print(", then \(message)", terminator:"")
    handler()
}


func expectTrue(_ flag: Bool? = false, file: StaticString = #file, line: UInt = #line) {
    guard flag == true else {
        fail("Bool was false", file: file, line: line)
        return
    }
    
    // Successful test
    print(" 👍  line: \(line)")
}

func fail(_ message: String = "default", file: StaticString = #file, line: UInt = #line) {
    let message = " 😡 failed: \(message) line: \(line) \(file) "
    print(message)
    
    if let failureHandler = TestDependencies.failureHandler {
        failureHandler(message, file, line)
        return
    }
}
