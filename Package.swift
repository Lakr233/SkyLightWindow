// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SkyLightWindow",
    platforms: [
        .macOS(.v11),
    ],
    products: [
        .library(name: "SkyLightWindow", targets: ["SkyLightWindow"]),
    ],
    targets: [
        .target(name: "SkyLightWindow"),
    ]
)
