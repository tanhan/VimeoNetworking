// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "VimeoNetworking",
    platforms: [
        .iOS("12.0")
    ],
    products: [
        .library(
            name: "VimeoNetworking",
            targets: ["VimeoNetworking"]
        )
    ],
    targets: [
        .target(
            name: "VimeoNetworking",
            path: "Sources",
            resources: [
                .process("Resources")
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
) 