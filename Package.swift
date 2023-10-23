// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ViewCondition",
    platforms: [
        .iOS(.v13),
        .macOS(.v13),
        .macCatalyst(.v13)
    ],
    products: [
        .library(
            name: "ViewCondition",
            targets: ["ViewCondition"]),
    ],
    dependencies: [
        .package(url: "https://github.com/nalexn/ViewInspector.git", from: "0.9.0")
    ],
    targets: [
        .target(
            name: "ViewCondition"),
        .testTarget(
            name: "ViewConditionTests",
            dependencies: ["ViewCondition", "ViewInspector"]),
    ]
)
