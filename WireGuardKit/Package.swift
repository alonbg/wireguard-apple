// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WireGuardKit",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "WireGuardKit", targets: ["WireGuardKit"]),
        .library(name: "libwg-go", targets: ["libwg-go"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "WireGuardKit",
            dependencies: ["libwg-go"]
        ),
        .systemLibrary(name: "libwg-go", path: "Sources/libwg-go", pkgConfig: nil, providers: nil),
        .testTarget(
            name: "WireGuardKitTests",
            dependencies: ["WireGuardKit"]),
    ]
)
