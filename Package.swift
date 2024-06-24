// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let tag = "v0.1.0"
let checksum = "f1221a4649ac40c2a2655f36258c37250ac2181c906fef6dc447b2e6f7936a4c"
let url = "https://github.com/johncantrell97/romer-sdk/releases/download/\(tag)/RomerFFI.xcframework.zip"

let package = Package(
    name: "romer",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Romer",
            targets: ["RomerFFI", "Romer"]),
    ],
    targets: [
        .target(
            name: "Romer",
            dependencies: ["RomerFFI"],
            path: "./bindings/swift/Sources"
        ),
        .binaryTarget(
            name: "RomerFFI",
            url: url,
            checksum: checksum
            )
    ]
)
