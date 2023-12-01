<p>
  <img src="https://img.shields.io/badge/Swift-5.9-f05318.svg" />
  <img src="https://img.shields.io/badge/iOS->= 12.0-blue.svg" />
  <img src="https://img.shields.io/badge/macOS->= 10.13-blue.svg" />
  <img src="https://img.shields.io/badge/watchOS->= 4.0-blue.svg" />
  <img src="https://img.shields.io/badge/tvOS->= 12.0-blue.svg" />
  <img src="https://img.shields.io/badge/visionOS->= 1.0-blue.svg" />
</p>

# FunctionalPrimitives

Swift functional primitives.

## Installation

### Xcode

1. Click File > Add Package Dependencies
2. Paste the following link into the search field on the upper-right:
   ```
   https://github.com/gleb032/FunctionalPrimitives.git
   ```

### Swift Package Manager

In `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/gleb032/FunctionalPrimitives.git", from: "1.0.0")
]
```

## Examples
### [`weakify`](https://github.com/gleb032/FunctionalPrimitives/blob/master/Sources/weakify.swift)
Converts a class method to a closure with a weak reference to the instance of the class.

For example we have `TableViewController` and cell `TableViewCell`:
```swift
class TableViewController: UITableViewController {
  ...
  func handleTextChange(_ text: String) {
    // some work
  }
}

class TableViewCell: UITableViewCell {
    var textChangedHandler: ((String) -> Void)?
    ...
}
```
We want to inject `handleTextChange` in `TableViewCell` in `cellForRowAt` method:
```swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
  cell.textChangedHandler = { self.handleTextChange($0) }
  return cell
}
```
This may causes a memory leak. Insted it we can use `weakify`:
```swift
  cell.textChangedHandler = weakify(self, in: type(of: self).handleTextChange)
```
Actually this is semantically the same as:
```swift
cell.textChangedHandler = { [weak self] in self?.handleTextChange($0) }
```

### [`papply`](https://github.com/gleb032/FunctionalPrimitives/blob/master/Sources/papply.swift)
Partially apply function.

For example:
```swift
func sum(_ lhs: Int, _ rhs: Int) -> Int {
  lhs + rhs
}

let add3 = papply(sum, 3)
let result = add3(4) // result = 7
```

### [`curry`](https://github.com/gleb032/FunctionalPrimitives/blob/master/Sources/curry.swift)/[`uncurry`](https://github.com/gleb032/FunctionalPrimitives/blob/master/Sources/uncurry.swift)
Curries/Uncurries a function with arguments.

For example:
```swift
func sum(_ lhs: Int, _ rhs: Int) -> Int {
  lhs + rhs
}

let curriedSum = curry(sum)
print(curriedSum(2)(3)) // 5

let uncurriedSum = uncarry(curriedSum)
print(uncurriedSum(2, 3)) // 5
```

### [`memoized`](https://github.com/gleb032/FunctionalPrimitives/blob/master/Sources/memoized.swift)
Memoization optimisation technique where the return values of a function are cached to avoid repeating the same computation.

For example:
```swift
func fibonacci(_ number: Int) -> Int {
  number < 2 
    ? number
    : fibonacci(number - 1) + fibonacci(number - 2)
}

print(fibonacci(40) // Very slow... O(e^n) complexity
print(memoized(fibonacci(40)) // O(n) complexity
```

### [`compose`](https://github.com/gleb032/FunctionalPrimitives/blob/master/Sources/compose.swift)
Composes functions, i.e. composition of functions `(A) -> (B)` and `(B) -> (C`) will give `(A) -> (C)`.

For example:
```swift
func double(_ num: Int) -> Int {
  return num * 2
}

func add5(_ num: Int) -> Int {
  return num + 5
}

func toString(_ num: Int) -> String {
  return String(num)
}

let pipeline = compose(double, add5, toString)
let result = pipeline(10) //  result = "30"
```


## License

The project is released under the [MIT License](https://github.com/gleb032/FunctionalPrimitives/blob/master/LICENSE)

