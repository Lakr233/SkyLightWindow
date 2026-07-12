// swift-tools-version: 6.1
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
    traits: [
        .trait(
            name: "OpenSwiftUI",
            description: "Use OpenSwiftUI instead of SwiftUI"
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/OpenSwiftUIProject/OpenSwiftUI-spm.git",
            exact: "0.19.1"
        ),
    ],
    targets: [
        .target(
            name: "SkyLightWindow",
            dependencies: [
                .product(
                    name: "OpenSwiftUI",
                    package: "OpenSwiftUI-spm",
                    condition: .when(traits: ["OpenSwiftUI"])
                ),
            ]
        ),
    ],
    swiftLanguageModes: [.v5]
)
