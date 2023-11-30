// https://github.com/apple/swift-evolution/blob/main/proposals/0408-pack-iteration.md
struct NotEqual: Error {}

@usableFromInline
internal func == <each Element: Equatable>(lhs: (repeat each Element), rhs: (repeat each Element)) -> Bool {
  func isEqual<T: Equatable>(_ left: T, _ right: T) throws {
    if left == right {
      return
    }

    throw NotEqual()
  }
  
  do {
    repeat try isEqual(each lhs, each rhs)
  } catch {
    return false
  }

  return true
}
