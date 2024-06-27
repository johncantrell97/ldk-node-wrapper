// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let tag = "v0.1.1"
let checksum = "41512b0b24da4e3cc47e6447760e92af5f6ef25d8a17f1394a40bb25583f1823"
let url = "https://github.com/johncantrell97/ldk-node-wrapper/releases/download/\(tag)/RomerFFI.xcframework.zip"

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
