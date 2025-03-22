/// Flips the order of arguments of a function that takes two parameters.
/// Example usage:
///
///     func divide(_ a: Int, _ b: Int) -> Int {
///         return a / b
///     }
///
///     let flippedDivide = flip(divide)
///     let result = flippedDivide(2, 10) // result = 5
///
/// - Parameters:
///   - f: The function whose arguments should be flipped.
///
/// - Returns: A function with the same behavior but with flipped parameter order.
@inlinable @inline(__always)
public func flip<Arg1, Arg2, Return>(_ f: @escaping (Arg1, Arg2) -> Return) -> (Arg2, Arg1) -> Return {
  { b, a in f(a, b) }
}
