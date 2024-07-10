/// Curries a function with arguments.
/// Example usage:
///
///     func add(_ a: Int, _ b: Int) -> Int {
///       return a + b
///     }
///
///     let curriedAdd = curry(add)
///     let add2 = curriedAdd(2)
///     let result = add2(3) // result = 5
///
/// - Parameters:
///   - f: The function to curry.
///
/// - Returns: Curried function
@inlinable @inline(__always)
public func curry<Arg1, Return>(
  _ f: @escaping (Arg1) -> Return
) -> (Arg1) -> Return {
  { (arg1: Arg1) -> Return in
    f(arg1)
  }
}

@inlinable @inline(__always)
public func curry<Arg1, Arg2, Return>(
  _ f: @escaping ((Arg1, Arg2)) -> Return
) -> (Arg1) -> (Arg2) -> Return {
  { (arg1: Arg1) -> (Arg2) -> Return in 
    { (arg2: Arg2) -> Return in
      f((arg1, arg2))
    }
  }
}

@inlinable @inline(__always)
public func curry<Arg1, Arg2, Arg3, Return>(
  _ f: @escaping ((Arg1, Arg2, Arg3)) -> Return
) -> (Arg1) -> (Arg2) -> (Arg3) -> Return {
  { (arg1: Arg1) -> (Arg2) -> (Arg3) -> Return in 
    { (arg2: Arg2) -> (Arg3) -> Return in
      { (arg3: Arg3) -> Return in
        f((arg1, arg2, arg3))
      }
    }
  }
}
