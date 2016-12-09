
func describe(_ message: String, file: StaticString = #file, line: UInt = #line, handler: ((Void) -> (Void))) {
    print("✏️ \(message)")
    handler()
}

