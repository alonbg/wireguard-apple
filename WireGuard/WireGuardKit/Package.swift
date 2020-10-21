// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WireGuardKit",
    platforms: [
        .macOS(.v10_14),
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "WireGuardKit",
            type: .dynamic,
            targets: ["WireGuardKit"]
        )
    ],
    dependencies: [
        .package(name: "WireGuardGoBridge", path: "WireGuardGoBridge")
    ],
    targets: [
        .target(name: "WireGuardKit", dependencies: ["WireGuardGoBridge"]),
        .testTarget(name: "WireGuardKitTests", dependencies: ["WireGuardKit"])
    ]
)
