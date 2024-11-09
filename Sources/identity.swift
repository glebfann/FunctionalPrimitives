/// Returns unchanged `value`.
/// Example usage:
///
///     flatMap(identity(_:))
///
/// - Note: You can use `identity` instead of `{ $0 }`.
@inlinable @inline(__always)
public func identity<T>(_ value: T) -> T {
  value
}
