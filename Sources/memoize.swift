import Foundation

/// Memoizes a function, caching its results for previously used inputs in a thread-safe manner.
///
/// Example usage:
///
///     let cachedCalculation = memoize(expensiveCalculation)
///     cachedCalculation(10)  // First call computes the result
///     cachedCalculation(10)  // Returns cached result
///
/// - Note: Optimized for performance by only locking cache operations, not the entire computation.
///   In high-concurrency environments, the original function may be called multiple times for the same input
///   if multiple threads detect a cache miss simultaneously, but the results will be consistent.
///
/// - Parameters:
///   - function: The function to be memoized.
///
/// - Returns: A thread-safe memoized version of the function.
@inlinable
public func memoize<Input: Hashable, Output>(
  _ function: @escaping (Input) -> Output
) -> (Input) -> Output {
  let cache = Locked(value: [Input: Output]())
  return { input in
    if let cachedResult = cache[input] {
      return cachedResult
    }
    
    let result = function(input)
    cache[input] = result
    return result
  }
}

/// Memoizes a function that can throw errors, caching its results in a thread-safe manner.
///
/// Example usage:
///
///     let cachedCalculation = memoize(expensiveCalculation)
///     try cachedCalculation(10)  // First call computes the result
///     try cachedCalculation(10)  // Returns cached result
///
/// - Note: Optimized for performance by only locking cache operations, not the entire computation.
///   In high-concurrency environments, the original function may be called multiple times for the same input
///   if multiple threads detect a cache miss simultaneously, but the results will be consistent.
///
/// - Parameters:
///   - function: The throwing function to be memoized.
///
/// - Returns: A thread-safe memoized version of the function.
@inlinable
public func memoize<Input: Hashable, Output>(
  _ function: @escaping (Input) throws -> Output
) -> (Input) throws -> Output {
  let cache = Locked(value: [Input: Output]())
  return { input in
    if let cachedResult = cache[input] {
      return cachedResult
    }
    
    let result = try function(input)
    cache[input] = result
    return result
  }
}

// MARK: - Strict Atomic Memoization

/// Memoizes a function with a guarantee of exactly one call per unique input value.
///
/// Example usage:
///
///     let cachedCalculation = atomicMemoize(expensiveCalculation)
///     cachedCalculation(10)  // First call computes the result
///     cachedCalculation(10)  // Returns cached result
///
/// - Note: This function provides a strict guarantee that the original function will be called exactly once
///   for each unique input value, even in high-concurrency environments, by locking the entire
///   check-compute-store process.
///
/// - Parameters:
///   - function: The function to be memoized.
///
/// - Returns: A thread-safe memoized function with strict guarantees.
@inlinable
public func atomicMemoize<Input: Hashable, Output>(
  _ function: @escaping (Input) -> Output
) -> (Input) -> Output {
  let lock = UnfairLock()
  var cache = [Input: Output]()
  return { input in
    lock.withLock {
      if let cachedResult = cache[input] {
        return cachedResult
      }
      
      let result = function(input)
      cache[input] = result
      return result
    }
  }
}

/// Memoizes a throwing function with a guarantee of exactly one call per unique input value.
///
/// Example usage:
///
///     let cachedCalculation = atomicMemoize(expensiveCalculation)
///     try cachedCalculation(10)  // First call computes the result
///     try cachedCalculation(10)  // Returns cached result
///
/// - Note: This function provides a strict guarantee that the original function will be called exactly once
///   for each unique input value, even in high-concurrency environments, by locking the entire
///   check-compute-store process.
///
/// - Parameters:
///   - function: The throwing function to be memoized.
///
/// - Returns: A thread-safe memoized function with strict guarantees.
@inlinable
public func atomicMemoize<Input: Hashable, Output>(
  _ function: @escaping (Input) throws -> Output
) -> (Input) throws -> Output {
  let lock = UnfairLock()
  var cache = [Input: Output]()
  return { input in
    try lock.withLock {
      if let cachedResult = cache[input] {
        return cachedResult
      }
      
      let result = try function(input)
      cache[input] = result
      return result
    }
  }
}

/// Memoizes a function, caching its results for previously used inputs.
/// Not thread-safe - should only be used in single-threaded contexts.
/// Example usage:
///
///     let cachedCalculation = memoizeUnsafe(expensiveCalculation)
///     cachedCalculation(10)  // First call computes the result
///     cachedCalculation(10)  // Returns cached result
///
/// - Parameters:
///   - function: The function to be memoized.
///
/// - Returns: A memoized version of the function.
public func memoizeUnsafe<Input: Hashable, Output>(
  _ function: @escaping (Input) -> Output
) -> (Input) -> Output {
  var cache: [Input: Output] = [:]
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
///     cachedQuery(user)
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
  var cache: [AnyHashable: Output] = [:]
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

@usableFromInline
@dynamicMemberLookup
internal final class Locked<Value>: @unchecked Sendable {
  private let lock = UnfairLock()
  private var value: Value
  
  @usableFromInline
  init(value: Value) {
    self.value = value
  }
  
  @usableFromInline
  internal subscript<Property>(dynamicMember keyPath: WritableKeyPath<Value, Property>) -> Property {
    get { lock.withLock { value[keyPath: keyPath] } }
    set { lock.withLock { value[keyPath: keyPath] = newValue } }
  }
  
  @usableFromInline
  internal subscript<Property>(dynamicMember keyPath: KeyPath<Value, Property>) -> Property {
    lock.withLock { value[keyPath: keyPath] }
  }
}

@usableFromInline
internal class UnfairLock: @unchecked Sendable {
  private let _lock: os_unfair_lock_t
  
  @usableFromInline
  init() {
    _lock = os_unfair_lock_t.allocate(capacity: 1)
    _lock.initialize(to: os_unfair_lock())
  }
  
  deinit {
    _lock.deinitialize(count: 1)
    _lock.deallocate()
  }
  
  @usableFromInline
  internal func withLock<T>(_ body: () throws -> T) rethrows -> T {
    os_unfair_lock_lock(_lock); defer { os_unfair_lock_unlock(_lock) }
    return try body()
  }
}
