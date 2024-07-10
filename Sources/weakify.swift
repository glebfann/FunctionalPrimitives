// MARK: iOS 17.0.0, macOS 14.0.0, watchOS 10.0.0 and above

/// Weakly captures a method of `target`
///
///     class ViewController: UIViewController {
///        let networkManager = NetworkManager()
///        ...
///
///        override func viewDidLoad() {
///          super.viewDidLoad()
///          networkManager.fetchData(completion: weakify(self, in: ViewController.updateUI))
///        }
///
///        func updateUI() {
///          ...
///        }
///      }
///
/// - Note: Semantically the same as `networkManager.fetchData { [weak self] in self?.updateUI() }`
///
/// - Parameters:
///   - target: The instance that should be captured weakly.
///   - action: A closure representing the method that takes one argument.
///
/// - Returns: A closure that weakly captures the method of `target`
@available(iOS 17.0.0, macOS 14.0.0, *)
@inlinable @inline(__always)
public func weakify<Target: AnyObject, each Arg>(
  _ target: Target,
  in action: @escaping (Target) -> (repeat each Arg) -> Void
) -> (repeat each Arg) -> Void {
  { [weak target] (arg: repeat each Arg) in
    guard let target else { return }
    action(target)(repeat each arg)
  }
}

@available(iOS 17.0.0, macOS 14.0.0, *)
@inlinable @inline(__always)
public func weakify<Target: AnyObject, each Arg>(
  _ target: Target,
  in action: @escaping (Target) -> (repeat each Arg) throws -> Void
) -> (repeat each Arg) throws -> Void {
  { [weak target] (arg: repeat each Arg) in
    guard let target else { return }
    try action(target)(repeat each arg)
  }
}

// MARK: iOS 12..<17, macOS 10.13.0..<14.0.0, watchOS 4..<10

@inlinable @inline(__always)
public func weakify<Target: AnyObject>(
  _ target: Target,
  in action: @escaping (Target) -> () -> Void
) -> () -> Void {
  { [weak target] in
    guard let target else { return }
    action(target)()
  }
}

@inlinable @inline(__always)
public func weakify<Target: AnyObject, Arg>(
  _ target: Target,
  in action: @escaping (Target) -> (Arg) -> Void
) -> (Arg) -> Void {
  { [weak target] arg in
    guard let target else { return }
    action(target)(arg)
  }
}

@inlinable @inline(__always)
public func weakify<Target: AnyObject, Arg1, Arg2>(
  _ target: Target,
  in action: @escaping (Target) -> (Arg1, Arg2) -> Void
) -> (Arg1, Arg2) -> Void {
  { [weak target] arg1, arg2 in
    guard let target else { return }
    action(target)(arg1, arg2)
  }
}

@inlinable @inline(__always)
public func weakify<Target: AnyObject, Arg1, Arg2, Arg3>(
  _ target: Target,
  in action: @escaping (Target) -> (Arg1, Arg2, Arg3) -> Void
) -> (Arg1, Arg2, Arg3) -> Void {
  { [weak target] arg1, arg2, arg3 in
    guard let target else { return }
    action(target)(arg1, arg2, arg3)
  }
}

@inlinable @inline(__always)
public func weakify<Target: AnyObject>(
  _ target: Target,
  in action: @escaping (Target) -> () throws -> Void
) -> () throws -> Void {
  { [weak target] in
    guard let target else { return }
    try action(target)()
  }
}

@inlinable @inline(__always)
public func weakify<Target: AnyObject, Arg>(
  _ target: Target,
  in action: @escaping (Target) -> (Arg) throws -> Void
) -> (Arg) throws -> Void {
  { [weak target] arg in
    guard let target else { return }
    try action(target)(arg)
  }
}

@inlinable @inline(__always)
public func weakify<Target: AnyObject, Arg1, Arg2>(
  _ target: Target,
  in action: @escaping (Target) -> (Arg1, Arg2) throws -> Void
) -> (Arg1, Arg2) throws -> Void {
  { [weak target] arg1, arg2 in
    guard let target else { return }
    try action(target)(arg1, arg2)
  }
}

@inlinable @inline(__always)
public func weakify<Target: AnyObject, Arg1, Arg2, Arg3>(
  _ target: Target,
  in action: @escaping (Target) -> (Arg1, Arg2, Arg3) throws -> Void
) -> (Arg1, Arg2, Arg3) throws -> Void {
  { [weak target] arg1, arg2, arg3 in
    guard let target else { return }
    try action(target)(arg1, arg2, arg3)
  }
}
