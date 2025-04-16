/// Ensures a function is called only once. Subsequent calls return the result of the first call.
/// Example usage:
///
///     var counter = 0
///     let increment = { counter += 1; return counter }
///
///     let onceIncrement = once(increment)
///
///     let result1 = onceIncrement() // result1 = 1
///     let result2 = onceIncrement() // result2 = 1
///     let result3 = onceIncrement() // result3 = 1
///
/// - Parameters:
///   - f: The function that should be executed only once.
///
/// - Returns: A function that, when called, will execute the original function only on the first invocation.
@inlinable
public func once<T>(_ f: @escaping () -> T) -> () -> T {
  var executed = false
  var result: T?
  
  return {
    if !executed {
      result = f()
      executed = true
    }
    
    return result ?? f()
  }
}
