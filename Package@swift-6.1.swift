// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// MARK: - OpenSwiftUI integration
// See https://github.com/OpenSwiftUIProject/OpenSwiftUI/blob/main/INTEGRATION.md

let openSwiftUISourcePath = Context.environment["OPENSWIFTUI_SOURCE_PATH"].flatMap {
    $0.isEmpty ? nil : $0
}
let openSwiftUIBinary = Context.environment["OPENSWIFTUI_BINARY"].flatMap {
    $0 == "1"
} ?? true
let macOSPlatform: SupportedPlatform = openSwiftUISourcePath == nil && openSwiftUIBinary
    ? .macOS(.v11)
    : .macOS(.v15)

let openSwiftUIDependency: Package.Dependency
let openSwiftUIPackageName: String

if let openSwiftUISourcePath {
    openSwiftUIDependency = .package(path: openSwiftUISourcePath)
    openSwiftUIPackageName = "OpenSwiftUI"
} else if openSwiftUIBinary {
    openSwiftUIDependency = .package(
        url: "https://github.com/OpenSwiftUIProject/OpenSwiftUI-spm.git",
        from: "0.19.2"
    )
    openSwiftUIPackageName = "OpenSwiftUI-spm"
} else {
    openSwiftUIDependency = .package(
        url: "https://github.com/OpenSwiftUIProject/OpenSwiftUI.git",
        branch: "main"
    )
    openSwiftUIPackageName = "OpenSwiftUI"
}

let package = Package(
    name: "SkyLightWindow",
    platforms: [
        macOSPlatform,
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
        openSwiftUIDependency,
    ],
    targets: [
        .target(
            name: "SkyLightWindow",
            dependencies: [
                .product(
                    name: "OpenSwiftUI",
                    package: openSwiftUIPackageName,
                    condition: .when(traits: ["OpenSwiftUI"])
                ),
            ]
        ),
    ],
    swiftLanguageModes: [.v5]
)
