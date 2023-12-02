# ViewCondition

An extension to the `View` protocol that provides conditional view modifiers.

## Overview

This extension adds methods to SwiftUI's `View` type that allow you to conditionally modify the view. These methods are useful for creating more readable and concise view hierarchies in SwiftUI.

## Documentation

You can find the documentation here: [https://kevinhermawan.github.io/ViewCondition/documentation/viewcondition](https://kevinhermawan.github.io/ViewCondition/documentation/viewcondition)

## Installation

You can add `ViewCondition` as a dependency to your project using Swift Package Manager by adding it to the dependencies value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/kevinhermawan/ViewCondition.git", .upToNextMajor(from: "1.0.0"))
]
```

Alternatively, in Xcode:

1. Open your project in Xcode.
2. Click on `File` -> `Swift Packages` -> `Add Package Dependency...`
3. Enter the repository URL: `https://github.com/kevinhermawan/ViewCondition.git`
4. Choose the version you want to add. You probably want to add the latest version.
5. Click `Add Package`.

## License

[MIT License](/LICENSE)
