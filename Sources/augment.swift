/// Augments a function to accept an additional first parameter that is ignored.
/// Example usage:
///
///     func validate(_ value: String) {
///         print("Validating: \(value)")
///     }
///
///     textField.onChange(of: text, augment(validate))
///
/// - Parameters:
///   - f: The function to augment, which will receive only the second parameter.
///
/// - Returns: A function accepting two parameters but using only the second one.
@inlinable @inline(__always)
public func augment<Arg1, Arg2>(_ f: @escaping (Arg2) -> Void) -> (Arg1, Arg2) -> Void {
  { arg1, arg2 in f(arg2) }
}

/// Augments a function to accept an additional second parameter that is ignored.
/// Example usage:
///
///     func validate(_ value: String) {
///         print("Validating: \(value)")
///     }
///
///     textField.onChange(of: text, augment(validate))
///
/// - Parameters:
///   - f: The function to augment, which will receive only the first parameter.
///
/// - Returns: A function accepting two parameters but using only the first one.
@inlinable @inline(__always)
public func augment<Arg1, Arg2>(_ f: @escaping (Arg1) -> Void) -> (Arg1, Arg2) -> Void {
  { arg1, arg2 in f(arg1) }
}

/// Augments a function to accept two parameters of the same type, using only one based on the specified selector.
/// Example usage:
///
///     func validate(_ value: String) {
///         print("Validating: \(value)")
///     }
///
///     textField.onChange(of: text, augment(validate, param: .first))
///
/// - Parameters:
///   - f: The function to augment.
///   - param: A selector specifying which parameter to pass to the original function.
///
/// - Returns: A function accepting two parameters but using only the one specified by the selector.
@inlinable
public func augment<Arg>(_ f: @escaping (Arg) -> Void, param: ParamSelector) -> (Arg, Arg) -> Void {
  { arg1, arg2 in
    switch param {
    case .first: f(arg1)
    case .second: f(arg2)
    }
  }
}

/// Selects which parameter to use in function application.
public enum ParamSelector {
  case first
  case second
}
