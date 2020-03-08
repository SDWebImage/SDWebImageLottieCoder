// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SDWebImageLottieCoder",
    platforms: [
        .macOS(.v10_10), .iOS(.v9), .tvOS(.v9), .watchOS(.v2)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "SDWebImageLottieCoder",
            targets: ["SDWebImageLottieCoder"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
       .package(url: "https://github.com/SDWebImage/SDWebImage.git", from: "5.6.0"),
       .package(url: "https://github.com/SDWebImage/librlottie-Xcode.git", from: "0.1.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "SDWebImageLottieCoder",
            dependencies: ["SDWebImage", "librlottie"],
            path: ".",
            sources: ["SDWebImageLottieCoder/Classes"],
            publicHeadersPath: "SDWebImageLottieCoder/Classes"
        )
    ]
)
