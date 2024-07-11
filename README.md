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
    .package(url: "https://github.com/gleb032/FunctionalPrimitives.git", from: "1.0.2")
]
```

## Examples
### [`weakify`](https://github.com/gleb032/FunctionalPrimitives/blob/master/Sources/weakify.swift)
Converts a class method to a closure with a weak reference to the instance of the class.

For example we have `ViewController`:
```swift
class ViewController: UIViewController {
  let networkManager = NetworkManager()
  ...

  override func viewDidLoad() {
    super.viewDidLoad()
    networkManager.fetchData {
      self.updateUI()
    }
  }

  func updateUI() {
    ...
  }

}
```
This may causes a memory leak. Insted it we can use `weakify`:
```swift
  networkManager.fetchData(completion: weakify(self, in: ViewController.updateUI))
```
Actually this is semantically the same as:
```swift
networkManager.fetchData { [weak self] in
  self?.updateUI()
}
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

let uncurriedSum = uncurry(curriedSum)
print(uncurriedSum(2, 3)) // 5
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
let result = pipeline(10) //  result = "25"
```


## License

The project is released under the [MIT License](https://github.com/gleb032/FunctionalPrimitives/blob/master/LICENSE)

