// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

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
            dependencies: ["RomerFFI"]
        ),
        .binaryTarget(
            name: "RomerFFI",
            path: "./RomerFFI.xcframework"
            )
    ]
)
