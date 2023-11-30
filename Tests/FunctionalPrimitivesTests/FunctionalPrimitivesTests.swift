import XCTest
@testable import FunctionalPrimitives

final class FunctionalPrimitivesTests: XCTestCase {

  class Foo {
    var x: Int = 0
    func update() {
      
    }
  }

  class Bar {
    var x: Int = 0
    func update(_ newX: Int) {
      x = newX
    }
  }

  func testWeakify() throws {
    let foo = Foo()
    let fooWeakifiedUpdate = weakify(foo, in: Foo.update)

    let bar = Bar()
    let barWeakifiedUpdate = weakify(bar, in: Bar.update)
  }

  func testPapply() throws {
    let addFive = papply(add, 5)
    let result = addFive(10)
  }

  private func add(_ lhs: Int, _ rhs: Int) -> Int {
    lhs + rhs
  }

}
