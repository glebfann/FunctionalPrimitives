// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FunctionalPrimitives",
    products: [
        .library(
            name: "FunctionalPrimitives",
            targets: ["FunctionalPrimitives"]
        ),
    ],
    targets: [
        .target(
            name: "FunctionalPrimitives",
            path: "Sources"
        ),
        .testTarget(
            name: "FunctionalPrimitivesTests",
            dependencies: ["FunctionalPrimitives"]
        ),
    ]
)
