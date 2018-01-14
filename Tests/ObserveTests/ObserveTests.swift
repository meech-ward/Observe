import XCTest
@testable import Observe


class ObserveTests: XCTestCase {
  
  override func setUp() {
  }
  
  /// Test that each describe method get's called in the order that it was written.
  func test_Describes_GetCalledInOrder() {
    var tests = [Int]()
    describe("test1") {
      tests.append(1)
      describe("describe") {
        tests.append(2)
        describe("describe2") {
          tests.append(3)
        }
      }
      describe("describe4") {
        tests.append(4)
      }
    }
    XCTAssertEqual(tests, [1,2,3,4])
  }
  
  func test_Contexts_GetCalledInOrder() {
    var tests = [Int]()
    context("test1") {
      tests.append(1)
      context("context") {
        tests.append(2)
        context("context2") {
          tests.append(3)
        }
      }
      context("context4") {
        tests.append(4)
      }
    }
    XCTAssertEqual(tests, [1,2,3,4])
  }
  
  func test_Its_GetCalledInOrder() {
    var tests = [Int]()
    it("test1") {
      tests.append(1)
      it("it") {
        tests.append(2)
        it("it2") {
          tests.append(3)
        }
      }
      it("it4") {
        tests.append(4)
      }
    }
    XCTAssertEqual(tests, [1,2,3,4])
  }
  
  /// Test that every before each method gets called before each describe function.
  func test_BeforeEach_GetsCalledBeforeEachDescribeFunction() {
    var tests = [Int]()
    describe("test2") {
      beforeEach {
        tests.append(1)
      }
      describe("") {
        beforeEach {
          tests.append(2)
        }
        describe("") {
          tests.append(3)
        }
        describe("") {
          tests.append(6)
        }
        describe("") {
          describe("") {
            tests.append(7)
          }
          describe("") {
            tests.append(9)
          }
          describe("") {
            tests.append(11)
          }
          describe("") {
            describe("") {
              tests.append(8)
            }
            describe("") {
              tests.append(10)
            }
          }
        }
      }
      describe("") {
        tests.append(4)
      }
      describe("") {
        tests.append(5)
      }
    }
    XCTAssertEqual(tests, [1, 1, 2, 3, 1, 2, 6, 1, 2, 1, 2, 7, 1, 2, 9, 1, 2, 11, 1, 2, 1, 2, 8, 1, 2, 10, 1, 4, 1, 5])
  }
  
}
