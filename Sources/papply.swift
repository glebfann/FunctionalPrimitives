/// Partially apply of function.
/// Example usage:
///
///     let add: (Int, Int) -> Int = { $0 + $1 }
///     let add3 = papply(add, 3)
///     let result = add3(4) // result = 7
///
/// - Parameters:
///   - f: A function taking one or more arguments and returning a value
///   - arg: Specified argument to be partially applied
///
/// - Returns: A partially applied function with the specified arguments.
@inlinable @inline(__always)
public func papply<Return, Arg>(
  _ f: @escaping (Arg) -> Return,
  _ arg: Arg
) -> () -> Return {
  { f(arg) }
}

/// Partially apply of function.
/// Example usage:
///
///     let add: (Int, Int) -> Int = { $0 + $1 }
///     let add3 = papply(add, 3)
///     let result = add3(4) // result = 7
///
/// - Parameters:
///   - f: A function taking one or more arguments and returning a value
///   - arg1: Specified argument to be partially applied
///
/// - Returns: A partially applied function with the specified arguments.
@inlinable @inline(__always)
public func papply<Return, Arg1, Arg2>(
  _ f: @escaping (Arg1, Arg2) -> Return,
  _ arg1: Arg1
) -> (Arg2) -> Return {
  { (arg2: Arg2) -> Return in f(arg1, arg2) }
}

/// Partially apply of function.
/// Example usage:
///
///     let add: (Int, Int) -> Int = { $0 + $1 }
///     let add3 = papply(add, 3)
///     let result = add3(4) // result = 7
///
/// - Parameters:
///   - f: A function taking one or more arguments and returning a value
///   - arg1: Specified argument to be partially applied
///   - arg2: Specified argument to be partially applied
///
/// - Returns: A partially applied function with the specified arguments.
@inlinable @inline(__always)
public func papply<Return, Arg1, Arg2>(
  _ f: @escaping (Arg1, Arg2) -> Return,
  _ arg1: Arg1,
  _ arg2: Arg2
) -> () -> Return {
  { f(arg1, arg2) }
}

/// Partially apply of function.
/// Example usage:
///
///     let add: (Int, Int) -> Int = { $0 + $1 }
///     let add3 = papply(add, 3)
///     let result = add3(4) // result = 7
///
/// - Parameters:
///   - f: A function taking one or more arguments and returning a value
///   - arg1: Specified argument to be partially applied
///   - arg2: Specified argument to be partially applied
///
/// - Returns: A partially applied function with the specified arguments.
@inlinable @inline(__always)
public func papply<Return, Arg1, Arg2, Arg3>(
  _ f: @escaping (Arg1, Arg2, Arg3) -> Return,
  _ arg1: Arg1
) -> (Arg2, Arg3) -> Return {
  { (arg2: Arg2, arg3: Arg3) -> Return in f(arg1, arg2, arg3) }
}

/// Partially apply of function.
/// Example usage:
///
///     let add: (Int, Int) -> Int = { $0 + $1 }
///     let add3 = papply(add, 3)
///     let result = add3(4) // result = 7
///
/// - Parameters:
///   - f: A function taking one or more arguments and returning a value
///   - arg1: Specified argument to be partially applied
///   - arg2: Specified argument to be partially applied
///
/// - Returns: A partially applied function with the specified arguments.
@inlinable @inline(__always)
public func papply<Return, Arg1, Arg2, Arg3>(
  _ f: @escaping (Arg1, Arg2, Arg3) -> Return,
  _ arg1: Arg1,
  _ arg2: Arg2
) -> (Arg3) -> Return {
  { (arg3: Arg3) -> Return in f(arg1, arg2, arg3) }
}

/// Partially apply of function.
/// Example usage:
///
///     let add: (Int, Int) -> Int = { $0 + $1 }
///     let add3 = papply(add, 3)
///     let result = add3(4) // result = 7
///
/// - Parameters:
///   - f: A function taking one or more arguments and returning a value
///   - arg1: Specified argument to be partially applied
///   - arg2: Specified argument to be partially applied
///   - arg3: Specified argument to be partially applied
///
/// - Returns: A partially applied function with the specified arguments.
@inlinable @inline(__always)
public func papply<Return, Arg1, Arg2, Arg3>(
  _ f: @escaping (Arg1, Arg2, Arg3) -> Return,
  _ arg1: Arg1,
  _ arg2: Arg2,
  _ arg3: Arg3
) -> () -> Return {
  { f(arg1, arg2, arg3) }
}
