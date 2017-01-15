# Observe

Observe is a BDD / TDD test framework for Swift 3 that pairs very nicely with the [Observe](https://github.com/ObserveSocial/Observe) assertion framework.

Observe and [Observe](https://github.com/ObserveSocial/Observe) are *not* coupled to any other frameworks so you can include this package in your tests or your main app code.

## Requirements

 * Swift 3.0+

## How To Use

### Installing

Open your `Package.Swift` file and add the following depedency:

```swift
import PackageDescription

let package = Package(
    name: "Hello",
    dependencies: [
        .Package(url: "https://github.com/ObserveSocial/Observe.git", majorVersion: 0, minor: 2)
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
    
    override func setUp() {
        super.setUp()
        Observe.failureHandler = XCTFail // Tell Observe to use XCTFail when an assertion is incorrect
    }
    
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
beforeEach {}
```

## Features

### BDD style

Describe application behavoiur rather than verifying code.

### No Dependencies

Observe is not coupled to XCTest at all, in fact Observe will never rely on any frameworks other than `Foundation`.

This means you never have to worry about importing any other frameworks into your code. It also means that you can use this framework in your application's tests or your application's core code.

## Contributing

All developers should feel welcome and encouraged to contribute to Observe, see our [CONTRIBUTING](https://github.com/ObserveSocial/Observe/CONTRIBUTING.md) document here to get involved.