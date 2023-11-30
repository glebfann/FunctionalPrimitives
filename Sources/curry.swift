@inlinable
public func curry<Arg1, Return>(
  _ f: @escaping (Arg1) -> Return
) -> (Arg1) -> Return {
  { (arg1: Arg1) -> Return in
    f(arg1)
  }
}

@inlinable
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
  {
    (arg1: Arg1) -> (Arg2) -> (Arg3) -> Return in {
      (arg2: Arg2) -> (Arg3) -> Return in {
        (arg3: Arg3) -> Return in f((arg1, arg2, arg3))
      }
    }
  }
}
