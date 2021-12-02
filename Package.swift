// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "StorageKit",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "StorageKit",
            targets: ["StorageKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/horizontalsystems/ThemeKit.git", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/horizontalsystems/ComponentKit.git", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/kishikawakatsumi/KeychainAccess.git", .upToNextMajor(from: "4.2.2")),
        .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1")),
    ],
    targets: [
        .target(
            name: "StorageKit",
            dependencies: ["ThemeKit", "ComponentKit", "KeychainAccess", "SnapKit"]),
    ]
)
