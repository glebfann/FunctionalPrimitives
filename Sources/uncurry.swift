/// Uncurries a function with arguments.
/// Example usage:
///
///     func add(a: Int) -> (Int) -> Int {
///       return { b in a + b }
///     }
///
///     let uncurriedAdd = uncurry(add)
///     let result = uncurriedAdd(5, 3) // result = 8
///
/// - Parameters:
///   - f: The function to uncurry.
///
/// - Returns: Uncurried function
@inlinable @inline(__always)
public func uncurry<Arg1, Return>(
  _ f: @escaping (Arg1) -> Return
) -> (Arg1) -> Return {
  { (arg1: Arg1) -> Return in
    f(arg1)
  }
}

@inlinable @inline(__always)
public func uncurry<Arg1, Arg2, Return>(
  _ f: @escaping (Arg1) -> (Arg2) -> Return
) -> (Arg1, Arg2) -> Return {
  { (arg1: Arg1, arg2: Arg2) -> Return in
    f(arg1)(arg2)
  }
}

@inlinable @inline(__always)
public func uncurry<Arg1, Arg2, Arg3, Return>(
  _ f: @escaping (Arg1) -> (Arg2) -> (Arg3) -> Return
) -> (Arg1, Arg2, Arg3) -> Return {
  { (arg1: Arg1, arg2: Arg2, arg3: Arg3) -> Return in
    f(arg1)(arg2)(arg3)
  }
}
