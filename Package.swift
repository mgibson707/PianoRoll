// swift-tools-version: 5.5

import PackageDescription

let package = Package(
    name: "PianoRoll",
    platforms: [.macOS(.v12), .iOS(.v15)],
    products: [.library(name: "PianoRoll", targets: ["PianoRoll"])],
    dependencies: [
        .package(url: "https://github.com/mgibson707/Tonic.git", branch: "main"),
    ],
    targets: [
        .target(name: "PianoRoll", dependencies: ["Tonic"]),
        .testTarget(name: "PianoRollTests", dependencies: ["PianoRoll"]),
    ]
)
