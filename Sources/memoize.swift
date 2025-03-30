/// Memoizes a function, caching its results for previously used inputs.
/// Not thread-safe - should only be used in single-threaded contexts.
/// Example usage:
///
///     let cachedCalc = memoizeUnsafe(expensiveCalculation)
///     cachedCalc(10)
///
/// - Parameters:
///   - function: The function to be memoized.
///
/// - Returns: A memoized version of the function.
public func memoizeUnsafe<Input: Hashable, Output>(
  _ function: @escaping (Input) -> Output
) -> (Input) -> Output {
  var cache = [Input: Output]()
  return { input in
    if let cachedResult = cache[input] {
      return cachedResult
    }
    
    let result = function(input)
    cache[input] = result
    return result
  }
}

/// Memoizes a function using a custom key generator for caching results.
/// Not thread-safe - should only be used in single-threaded contexts.
/// Example usage:
///
///     let cachedQuery = memoizeUnsafe(processUserData, keyedBy: { $0.id })
///     cachedQuery(user) // Выполняет запрос
///
/// - Parameters:
///   - function: The function to be memoized.
///   - keyGenerator: A function that derives a hashable key from the input.
///
/// - Returns: A memoized version of the function.
public func memoizeUnsafe<Input, Output>(
  _ function: @escaping (Input) -> Output,
  keyedBy keyGenerator: @escaping (Input) -> AnyHashable
) -> (Input) -> Output {
  var cache = [AnyHashable: Output]()
  return { input in
    let key = keyGenerator(input)
    
    if let cachedResult = cache[key] {
      return cachedResult
    }
    
    let result = function(input)
    cache[key] = result
    return result
  }
}
