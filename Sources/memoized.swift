// MARK: iOS 17.0.0, macOS 14.0.0 and above

/// Memoization optimisation technique where the return values of
/// a function are cached to avoid repeating the same computation.
/// Example usage:
///
///     func fibonacci(_ number: Int) -> Int {
///       number < 2 
///         ? number
///         : fibonacci(number - 1) + fibonacci(number - 2)
///     }
///
///     print(fibonacci(40) // Very slow... O(e^n) complexity
///     print(memoized(fibonacci(40)) // O(n) complexity
///
/// - Parameters:
///   - f: A function whose result is to be memoized.
///
/// - Returns: Function with memoization
@available(iOS 17.0.0, macOS 14.0.0, watchOS 10.0.0, *)
@inlinable
public func memoized<each Arg: Hashable, Return>(
  _ f: @escaping ((repeat each Arg) -> Return)
) -> (repeat each Arg) -> Return {
  var cache = [Key<repeat each Arg>: Return]()
  // Parameter packs workaround
  let get: (Key<repeat each Arg>) -> Return? = { cache[$0] }
  let set: (Key<repeat each Arg>, Return) -> Void = { cache[$0] = $1 }
  return { (arg: repeat each Arg) -> Return in
    let key = Key<repeat each Arg>(arg: (repeat each arg))
    if let cached = get(key) {
      return cached
    }
    let value = f(repeat each arg)
    set(key, value)
    return value
  }
}

@available(iOS 17.0.0, macOS 14.0.0, watchOS 10.0.0, *)
@inlinable
public func memoized<each Arg: Hashable, Return>(
  _ f: @escaping ((repeat each Arg) throws -> Return)
) -> (repeat each Arg) throws -> Return {
  var cache = [Key<repeat each Arg>: Return]()
  // Parameter packs workaround
  let get: (Key<repeat each Arg>) -> Return? = { cache[$0] }
  let set: (Key<repeat each Arg>, Return) -> Void = { cache[$0] = $1 }
  return { (arg: repeat each Arg) -> Return in
    let key = Key<repeat each Arg>(arg: (repeat each arg))
    if let cached = get(key) {
      return cached
    }
    let value = try f(repeat each arg)
    set(key, value)
    return value
  }
}

// MARK: UP to 17.0.0, macOS 14.0.0

@inlinable
public func memoized<Arg: Hashable, Return>(
  _ f: @escaping ((Arg) -> Return)
) -> (Arg) -> Return {
  var cache = [Arg: Return]()
  return { (arg: Arg) -> Return in
    if let cached = cache[arg] {
      return cached
    }
    let value = f(arg)
    cache[arg] = value
    return value
  }
}

@inlinable
public func memoized<Arg1: Hashable, Arg2: Hashable, Return>(
  _ f: @escaping ((Arg1, Arg2) -> Return)
) -> (Arg1, Arg2) -> Return {
  var cache = [Key2<Arg1, Arg2>: Return]()
  return { (arg1: Arg1, arg2: Arg2) -> Return in
    let key = Key2(arg1: arg1, arg2: arg2)
    if let cached = cache[key] {
      return cached
    }
    let value = f(arg1, arg2)
    cache[key] = value
    return value
  }
}

@inlinable
public func memoized<Arg1: Hashable, Arg2: Hashable, Arg3: Hashable, Return>(
  _ f: @escaping ((Arg1, Arg2, Arg3) -> Return)
) -> (Arg1, Arg2, Arg3) -> Return {
  var cache = [Key3<Arg1, Arg2, Arg3>: Return]()
  return { (arg1: Arg1, arg2: Arg2, arg3: Arg3) -> Return in
    let key = Key3(arg1: arg1, arg2: arg2, arg3: arg3)
    if let cached = cache[key] {
      return cached
    }
    let value = f(arg1, arg2, arg3)
    cache[key] = value
    return value
  }
}

@inlinable
public func memoized<Arg: Hashable, Return>(
  _ f: @escaping ((Arg) throws -> Return)
) -> (Arg) throws -> Return {
  var cache = [Arg: Return]()
  return { (arg: Arg) -> Return in
    if let cached = cache[arg] {
      return cached
    }
    let value = try f(arg)
    cache[arg] = value
    return value
  }
}

@inlinable
public func memoized<Arg1: Hashable, Arg2: Hashable, Return>(
  _ f: @escaping ((Arg1, Arg2) throws -> Return)
) -> (Arg1, Arg2) throws -> Return {
  var cache = [Key2<Arg1, Arg2>: Return]()
  return { (arg1: Arg1, arg2: Arg2) -> Return in
    let key = Key2(arg1: arg1, arg2: arg2)
    if let cached = cache[key] {
      return cached
    }
    let value = try f(arg1, arg2)
    cache[key] = value
    return value
  }
}

@inlinable
public func memoized<Arg1: Hashable, Arg2: Hashable, Arg3: Hashable, Return>(
  _ f: @escaping ((Arg1, Arg2, Arg3) throws -> Return)
) -> (Arg1, Arg2, Arg3) throws -> Return {
  var cache = [Key3<Arg1, Arg2, Arg3>: Return]()
  return { (arg1: Arg1, arg2: Arg2, arg3: Arg3) -> Return in
    let key = Key3(arg1: arg1, arg2: arg2, arg3: arg3)
    if let cached = cache[key] {
      return cached
    }
    let value = try f(arg1, arg2, arg3)
    cache[key] = value
    return value
  }
}

