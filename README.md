# ViewCondition

An extension to the `View` protocol that provides conditional view modifiers.

## Overview

`ViewCondition` enhances SwiftUI's conditional rendering capabilities, makes it easier for developers to create adaptive and responsive user interfaces. With `ViewCondition`, you can easily apply modifiers, control visibility, or hide views based on various conditions such as boolean logic, operating system, or module availability. This flexibility allows you to tailor your app's interface for different platforms and user needs without complex conditional statements.

## Documentation

You can find the documentation here: [https://kevinhermawan.github.io/ViewCondition/documentation/viewcondition](https://kevinhermawan.github.io/ViewCondition/documentation/viewcondition)

## Installation

You can add `ViewCondition` as a dependency to your project using Swift Package Manager by adding it to the dependencies value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/kevinhermawan/ViewCondition.git", .upToNextMajor(from: "2.0.0"))
]
```

Alternatively, in Xcode:

1. Open your project in Xcode.
2. Click on `File` -> `Swift Packages` -> `Add Package Dependency...`
3. Enter the repository URL: `https://github.com/kevinhermawan/ViewCondition.git`
4. Choose the version you want to add. You probably want to add the latest version.
5. Click `Add Package`.

## Usage

### If Modifiers

The `if` modifiers allow you to conditionally apply modifications to a view.

#### Basic Boolean Condition

```swift
Text("Hello, World!")
    .if(someCondition) { view in
        view.foregroundColor(.red)
    }
```

#### Operating System Specific

```swift
Text("Hello, World!")
    .if(os: .iOS) { view in
        view.padding()
    }
```

#### Module Availability

```swift
Text("Hello, World!")
    .if(canImport: .uiKit) { view in
        view.foregroundColor(.blue)
    }
```

#### Multiple Boolean Conditions

```swift
Text("Hello, World!")
    .if([condition1, condition2, condition3]) { view in
        view.bold()
    }
```

#### Multiple Operating Systems

```swift
Text("Hello, World!")
    .if(os: [.iOS, .macOS]) { view in
        view.font(.largeTitle)
    }
```

#### Multiple Module Availabilities

```swift
Text("Hello, World!")
    .if(canImport: [.uiKit, .appKit]) { view in
        view.italic()
    }
```

### Visible Modifiers

The `visible` modifiers control the visibility of a view.

#### Basic Boolean Condition

```swift
Text("I'm visible!")
    .visible(if: someCondition)
```

#### With Remove Option

```swift
Text("I might be removed")
    .visible(if: someCondition, removeCompletely: true)
```

#### Operating System Specific

```swift
Text("iOS Only")
    .visible(on: .iOS)
```

#### Module Availability

```swift
Text("UIKit Available")
    .visible(ifCanImport: .uiKit)
```

#### Multiple Boolean Conditions

```swift
Text("All conditions must be true")
    .visible(if: [condition1, condition2, condition3])
```

#### Multiple Operating Systems

```swift
Text("iOS or macOS")
    .visible(on: [.iOS, .macOS])
```

#### Multiple Module Availabilities

```swift
Text("UIKit or AppKit")
    .visible(ifCanImport: [.uiKit, .appKit])
```

### Hide Modifiers

The `hide` modifiers control the hiding of a view.

#### Basic Boolean Condition

```swift
Text("I'm hidden!")
    .hide(if: someCondition)
```

#### With Remove Option

```swift
Text("I might be removed")
    .hide(if: someCondition, removeCompletely: true)
```

#### Operating System Specific

```swift
Text("Hidden on iOS")
    .hide(on: .iOS)
```

#### Module Availability

```swift
Text("Hidden if UIKit is available")
    .hide(ifCanImport: .uiKit)
```

#### Multiple Boolean Conditions

```swift
Text("Hidden if all conditions are true")
    .hide(if: [condition1, condition2, condition3])
```

#### Multiple Operating Systems

```swift
Text("Hidden on iOS or macOS")
    .hide(on: [.iOS, .macOS])
```

#### Multiple Module Availabilities

```swift
Text("Hidden if UIKit or AppKit is available")
    .hide(ifCanImport: [.uiKit, .appKit])
```

## License

[MIT License](/LICENSE)
