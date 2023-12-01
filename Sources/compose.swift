/// Composition of functions. Throwable variant also available.
/// Example usage:
///
///     func double(_ num: Int) -> Int {
///       return num * 2
///     }
///
///     func add5(_ num: Int) -> Int {
///       return num + 5
///     }
///
///     func toString(_ num: Int) -> String {
///       return String(num)
///     }
///
///     let pipeline = compose(double, add5, toString)
///     let result = pipeline(10) //  result = "30"
///
///
/// - Note: In math, function composition is an operation  ∘  that takes two functions f and g,
///   and produces a function h = g  ∘  f such that h(x) = g(f(x))
///
/// - Parameters:
///   - f1: Function that takes `Arg1` and returns `Arg2`
///   - f2: Function that takes `Arg2` and returns `Arg3`
///   - f3: Function that takes `Arg3` and returns `Arg4`
///   - f3: Function that takes `Arg4` and returns `Arg5`
///
/// - Returns: A function that takes an initial argument and applies the entire chain
///   of functions to it, producing a final transformed result.
@inlinable @inline(__always)
public func compose<Arg1, Arg2, Arg3>(
  _ f1: @escaping (Arg1) -> Arg2,
  _ f2: @escaping (Arg2) -> Arg3
) -> (Arg1) -> Arg3 {
  { (arg1: Arg1) -> Arg3 in f2(f1(arg1)) }
}

@inlinable @inline(__always)
func compose<Arg1, Arg2, Arg3, Arg4>(
  _ f1: @escaping (Arg1) -> Arg2,
  _ f2: @escaping (Arg2) -> Arg3,
  _ f3: @escaping (Arg3) -> Arg4
) -> (Arg1) -> Arg4 {
  { (arg1: Arg1) -> Arg4 in f3(f2(f1(arg1))) }
}

@inlinable @inline(__always)
func compose<Arg1, Arg2, Arg3, Arg4, Arg5>(
  _ f1: @escaping (Arg1) -> Arg2,
  _ f2: @escaping (Arg2) -> Arg3,
  _ f3: @escaping (Arg3) -> Arg4,
  _ f4: @escaping (Arg4) -> Arg5
) -> (Arg1) -> Arg5 {
  { (arg1: Arg1) -> Arg5 in f4(f3(f2(f1(arg1)))) }
}

// MARK: Throwable compose

@inlinable @inline(__always)
public func compose<Arg1, Arg2, Arg3>(
  _ f1: @escaping (Arg1) throws -> Arg2,
  _ f2: @escaping (Arg2) -> Arg3
) -> (Arg1) throws -> Arg3 {
  { arg1 in try f2(f1(arg1)) }
}

@inlinable @inline(__always)
public func compose<Arg1, Arg2, Arg3>(
  _ f1: @escaping (Arg1) -> Arg2,
  _ f2: @escaping (Arg2) throws -> Arg3
) -> (Arg1) throws -> Arg3 {
  { (arg1: Arg1) -> Arg3 in try f2(f1(arg1)) }
}

@inlinable @inline(__always)
public func compose<Arg1, Arg2, Arg3>(
  _ f1: @escaping (Arg1) throws -> Arg2,
  _ f2: @escaping (Arg2) throws -> Arg3
) -> (Arg1) throws -> Arg3 {
  { (arg1: Arg1) -> Arg3 in try f2(f1(arg1)) }
}

@inlinable @inline(__always)
func compose<Arg1, Arg2, Arg3, Arg4>(
  _ f1: @escaping (Arg1) throws -> Arg2,
  _ f2: @escaping (Arg2) -> Arg3,
  _ f3: @escaping (Arg3) -> Arg4
) -> (Arg1) throws -> Arg4 {
  { (arg1: Arg1) -> Arg4 in try f3(f2(f1(arg1))) }
}

@inlinable @inline(__always)
func compose<Arg1, Arg2, Arg3, Arg4>(
  _ f1: @escaping (Arg1) -> Arg2,
  _ f2: @escaping (Arg2) throws -> Arg3,
  _ f3: @escaping (Arg3) -> Arg4
) -> (Arg1) throws -> Arg4 {
  { (arg1: Arg1) -> Arg4 in try f3(f2(f1(arg1))) }
}

@inlinable @inline(__always)
func compose<Arg1, Arg2, Arg3, Arg4>(
  _ f1: @escaping (Arg1) -> Arg2,
  _ f2: @escaping (Arg2) -> Arg3,
  _ f3: @escaping (Arg3) throws -> Arg4
) -> (Arg1) throws -> Arg4 {
  { (arg1: Arg1) -> Arg4 in try f3(f2(f1(arg1))) }
}

@inlinable @inline(__always)
func compose<Arg1, Arg2, Arg3, Arg4>(
  _ f1: @escaping (Arg1) throws -> Arg2,
  _ f2: @escaping (Arg2) throws -> Arg3,
  _ f3: @escaping (Arg3) -> Arg4
) -> (Arg1) throws -> Arg4 {
  { (arg1: Arg1) -> Arg4 in try f3(f2(f1(arg1))) }
}

@inlinable @inline(__always)
func compose<Arg1, Arg2, Arg3, Arg4>(
  _ f1: @escaping (Arg1) throws -> Arg2,
  _ f2: @escaping (Arg2) -> Arg3,
  _ f3: @escaping (Arg3) throws -> Arg4
) -> (Arg1) throws -> Arg4 {
  { (arg1: Arg1) -> Arg4 in try f3(f2(f1(arg1))) }
}

@inlinable @inline(__always)
func compose<Arg1, Arg2, Arg3, Arg4>(
  _ f1: @escaping (Arg1) -> Arg2,
  _ f2: @escaping (Arg2) throws -> Arg3,
  _ f3: @escaping (Arg3) throws -> Arg4
) -> (Arg1) throws -> Arg4 {
  { (arg1: Arg1) -> Arg4 in try f3(f2(f1(arg1))) }
}

@inlinable @inline(__always)
func compose<Arg1, Arg2, Arg3, Arg4>(
  _ f1: @escaping (Arg1) throws -> Arg2,
  _ f2: @escaping (Arg2) throws -> Arg3,
  _ f3: @escaping (Arg3) throws -> Arg4
) -> (Arg1) throws -> Arg4 {
  { (arg1: Arg1) -> Arg4 in try f3(f2(f1(arg1))) }
}

