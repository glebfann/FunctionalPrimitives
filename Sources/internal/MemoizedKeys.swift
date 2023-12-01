// MARK: iOS 17.0.0, macOS 14.0.0, watchOS 10.0.0 and above

@available(iOS 17.0.0, macOS 14.0.0, watchOS 10.0.0, *)
@usableFromInline
internal struct Key<each Arg: Hashable>: Hashable {
  @usableFromInline
  internal let arg: (repeat each Arg)

  @usableFromInline
  init(arg: (repeat each Arg)) {
    self.arg = arg
  }

  @inlinable
  static func == (lhs: Key<repeat each Arg>, rhs: Key<repeat each Arg>) -> Bool {
     (repeat each lhs.arg) == (repeat each rhs.arg)
  }

  @inlinable
  func hash(into hasher: inout Hasher) {
    repeat hasher.combine(each arg)
  }
}

// MARK: iOS 12..<17, macOS 10.13.0..<14.0.0, watchOS 4..<10

@usableFromInline
internal struct Key2<Arg1: Hashable, Arg2: Hashable>: Hashable {
  let arg1: Arg1
  let arg2: Arg2

  @usableFromInline
  init(arg1: Arg1, arg2: Arg2) {
    self.arg1 = arg1
    self.arg2 = arg2
  }
}

@usableFromInline
internal struct Key3<Arg1: Hashable, Arg2: Hashable, Arg3: Hashable>: Hashable {
  let arg1: Arg1
  let arg2: Arg2
  let arg3: Arg3

  @usableFromInline
  init(arg1: Arg1, arg2: Arg2, arg3: Arg3) {
    self.arg1 = arg1
    self.arg2 = arg2
    self.arg3 = arg3
  }
}
