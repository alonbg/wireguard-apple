// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WireGuardGoBridge",
    platforms: [
        .macOS(.v10_14),
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "WireGuardGoBridge",
            targets: ["WireGuardGoBridge"]
        )
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "WireGuardGoBridge",
            path: "WireGuardGoBridge.xcframework"
        )
    ]
)
