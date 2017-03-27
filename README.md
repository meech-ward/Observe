# Observe

Observe is a BDD / TDD test framework for Swift 3 that pairs very nicely with the [Focus](https://github.com/ObserveSocial/Focus) assertion framework.

Observe and [Focus](https://github.com/ObserveSocial/Focus) are *not* coupled to any other frameworks so you can include this package in your tests or your main app code.

## Requirements

 * Swift 3.0+

## How To Use

### Installing

Open your `Package.Swift` file and add the following dependency:

```swift
import PackageDescription

let package = Package(
    name: "Hello",
    dependencies: [
        .Package(url: "https://github.com/ObserveSocial/Observe.git", majorVersion: 0)
    ]
)
```

Run `swift build` in terminal to fetch this new dependency.

### Running Tests With XCTest

1. Create a new XCTest file
2. `import Observe`

```swift
import XCTest
import Observe

class SimpleTest: XCTestCase {
    
    func testSpec() {
        describe("Person") {
            
            context("Initialize a new Person") {
                var person: Person!
                
                beforeEach {
                    person(name: "Sam")
                }
                
                it("should be called sam") {
                    XCTAssertEqual(person.name, "Sam")
                }
            }
        }
    }
}

```

## Functions

```swift
describe("") {}
context("") {}
it("") {}

given("") {}
when("") {}
then("") {}
and("") {}

beforeEach {}
```

## Reporter

The reporter defines how output is logged to the console.

Observe defines a `Reportable` protocol that you can implement in order to customize how test output is logged. By default, Observe uses it's own very simple reporter. There is also a [Clean Reporter](https://github.com/ObserveSocial/CleanReporter) which we recommend you use.

### Custom Reporter

If you want to build your own reporter, simply create a new type and have it conform to the `Reportable` protocol. Then tell Observe to use your custom Reporter.


```swift
import XCTest
import Observe

class MyReporter: Observe.Reportable {
    
    let sharedInstance = MyReporter()
    
    func willRunBlock(file: StaticString, method: String, line: UInt, message: String, blockType: BlockType, indentationLevel: Int) {
        print(message)
    }
    
    func didRunBlock(file: StaticString, method: String, line: UInt, message: String, blockType: BlockType, indentationLevel: Int) {   
    }
}

class SimpleTest: XCTestCase {
    
    override class func setUp() {
        super.setUp()
        let reporter = MyReporter.sharedInstance
        Observe.set(reporter: reporter)
    }
    
    func testSpec() {
        describe("Person") {
            ...
        }
    }
}

class AnotherSimpleTest: XCTestCase {
    
    override class func setUp() {
        super.setUp()
        let reporter = MyReporter.sharedInstance
        Observe.set(reporter: reporter)
    }
    ...
}

```

It can be useful to have your reporter be a singleton so that you can share state across multiple tests. This will allow you to keep track of stats like how many tests were executed.

## Features

### BDD style

Describe application behaviour rather than verifying code.

### No Dependencies

Observe is not coupled to XCTest at all, in fact Observe will never rely on any frameworks other than `Foundation`.

This means you never have to worry about importing any other frameworks into your code. It also means that you can use this framework in your application's tests or your application's core code.

## Contributing

All developers should feel welcome and encouraged to contribute to Observe, see our [CONTRIBUTING](https://github.com/ObserveSocial/Observe/CONTRIBUTING.md) document here to get involved.

