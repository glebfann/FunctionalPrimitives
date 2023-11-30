@inlinable @inline(__always)
public func papply<Return, Arg>(
    _ f: @escaping (Arg) -> Return, 
    _ arg: Arg
) -> () -> Return {
    { f(arg) }
}

@inlinable @inline(__always)
public func papply<Return, Arg1, Arg2>(
    _ f: @escaping (Arg1, Arg2) -> Return,
    _ arg1: Arg1
) -> (Arg2) -> Return {
    { f(arg1, $0) }
}

@inlinable @inline(__always)
public func papply<Return, Arg1, Arg2>(
    _ f: @escaping (Arg1, Arg2) -> Return,
    _ arg1: Arg1,
    _ arg2: Arg2
) -> () -> Return {
    { f(arg1, arg2) }
}

@inlinable @inline(__always)
public func papply<Return, Arg1, Arg2, Arg3>(
    _ f: @escaping (Arg1, Arg2, Arg3) -> Return,
    _ arg1: Arg1
) -> (Arg2, Arg3) -> Return {
    { f(arg1, $0, $1) }
}

@inlinable @inline(__always)
public func papply<Return, Arg1, Arg2, Arg3>(
    _ f: @escaping (Arg1, Arg2, Arg3) -> Return,
    _ arg1: Arg1,
    _ arg2: Arg2
) -> (Arg3) -> Return {
    { f(arg1, arg2, $0) }
}

@inlinable @inline(__always)
public func papply<Return, Arg1, Arg2, Arg3>(
    _ f: @escaping (Arg1, Arg2, Arg3) -> Return,
    _ arg1: Arg1,
    _ arg2: Arg2,
    _ arg3: Arg3
) -> () -> Return {
    { f(arg1, arg2, arg3) }
}
