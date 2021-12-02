# Storage Kit


## Requirements

## Installation

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code
and is integrated into the `swift` compiler. It is in early development, but StorageKit does support its use on
supported platforms.

Once you have your Swift package set up, adding StorageKit as a dependency is as easy as adding it to
the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/horizontalsystems/StorageKit.git", .upToNextMajor(from: "1.0.0"))
]
```

## License

StorageKit is available under the MIT license. See the LICENSE file for more info.
