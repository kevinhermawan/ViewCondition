# ViewCondition

A SwiftUI View extension for conditional visibility control.

## Overview

`ViewCondition` makes it easy to show or hide parts of your app's screen based on certain conditions. This helps keep your code clean and easy to understand, simplifying the creation of dynamic and responsive user interfaces in SwiftUI.

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

## Usage

```swift
import SwiftUI
import ViewCondition

struct ContentView: View {
    @State private var isLoading: Bool = true
    @State private var showError: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            // Conditionally modify the loading text view.
            Text(isLoading ? "Loading data..." : "Data Loaded")
                .if(isLoading) { text in
                    text.fontWeight(.bold)
                        .foregroundColor(.orange)
                }
                .if(!isLoading) { text in
                    text.fontWeight(.bold)
                        .foregroundColor(.green)
                }

            // Display error message conditionally.
            Text("Failed to load data!")
                .foregroundColor(.red)
                .visible(if: showError)

            // A button to simulate data loading completion.
            Button("Complete Loading") {
                isLoading = false
            }

            // A button to simulate an error during data fetching.
            Button("Simulate Error") {
                showError = true
                isLoading = false
            }

            // Some extra information that is hidden when there's an error.
            Text("Here's some additional info about the data.")
                .hide(if: showError)
        }
        .padding()
    }
}
```

## License

[MIT License](/LICENSE)
