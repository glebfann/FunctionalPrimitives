/// Creates a function that always returns the same value, regardless of its input.
/// Example usage:
///
///     User(
///       name: name,
///       access: constant(.admin)
///     )
///
/// - Parameters:
///   - value: The value that the returned function will always return.
///
/// - Returns: A function that always returns the specified value.
@available(iOS 17.0.0, macOS 14.0.0, *)
@inlinable @inline(__always)
public func constant<each Arg, Return>(_ value: Return) -> (repeat each Arg) -> Return {
  { (_: repeat each Arg) in value }
}

/// Creates a function that always returns the same value, regardless of its input.
/// Example usage:
///
///     User(
///       name: name,
///       access: constant(.admin)
///     )
///
/// - Parameters:
///   - value: The value that the returned function will always return.
///
/// - Returns: A function that always returns the specified value.
@inlinable @inline(__always)
public func constant<Arg, Return>(_ value: Return) -> (Arg) -> Return {
  { _ in value }
}

/// Creates a function that always returns the same value, regardless of its input.
/// Example usage:
///
///     User(
///       name: name,
///       access: constant(.admin)
///     )
///
/// - Parameters:
///   - value: The value that the returned function will always return.
///
/// - Returns: A function that always returns the specified value.
@inlinable @inline(__always)
public func constant<Arg1, Arg2, Return>(_ value: Return) -> (Arg1, Arg2) -> Return {
  { _, _ in value }
}

/// Creates a function that always returns the same value, regardless of its input.
/// Example usage:
///
///     User(
///       name: name,
///       access: constant(.admin)
///     )
///
/// - Parameters:
///   - value: The value that the returned function will always return.
///
/// - Returns: A function that always returns the specified value.
@inlinable @inline(__always)
public func constant<Arg1, Arg2, Arg3, Return>(_ value: Return) -> (Arg1, Arg2, Arg3) -> Return {
  { _, _, _ in value }
}

/// Creates a function that always returns the same value, regardless of its input.
/// Example usage:
///
///     User(
///       name: name,
///       access: constant(.admin)
///     )
///
/// - Parameters:
///   - value: The value that the returned function will always return.
///
/// - Returns: A function that always returns the specified value.
@inlinable @inline(__always)
public func constant<Arg1, Arg2, Arg3, Arg4, Return>(_ value: Return) -> (Arg1, Arg2, Arg3, Arg4) -> Return {
  { _, _, _, _ in value }
}
