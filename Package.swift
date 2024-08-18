// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-qpl",
    platforms: [.macOS(.v14), .iOS(.v16), .tvOS(.v16), .watchOS(.v10), .macCatalyst(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "QPL",
            targets: ["QPL"]),
        .library(
            name: "QTI",
            targets: ["QTI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/CoreOffice/XMLCoder.git", .upToNextMajor(from: "0.17.1")),
        .package(url: "https://github.com/weichsel/ZIPFoundation.git", .upToNextMajor(from: "0.9.19"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "QPL",
            dependencies: [
                "XMLCoder",
                "ZIPFoundation",
                "QTI"
            ]),
        .target(
            name: "QTI",
            dependencies: [
                "XMLCoder"
            ]),
        .testTarget(
            name: "QPLTests",
            dependencies: ["QPL", "QTI"]
        ),
    ]
)
