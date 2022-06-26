// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FlowGRPC",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
    ],
    products: [
        .library(name: "FlowGRPC", targets: ["FlowGRPC"]),
    ],
    dependencies: [
        .package(name: "Flow", url: "https://github.com/Outblock/flow-swift.git", from: "0.2.0"),
        .package(url: "https://github.com/grpc/grpc-swift.git", from: "1.8.0"),
    ],
    targets: [
        .target(name: "FlowGRPC",
                dependencies: ["Flow",
                               .product(name: "GRPC", package: "grpc-swift")],
                path: "Sources/FlowGRPC"),
        .testTarget(
            name: "FlowTests",
            dependencies: ["Flow", "FlowGRPC"],
            path: "Tests"
        ),
    ]
)
