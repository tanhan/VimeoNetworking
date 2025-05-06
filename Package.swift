// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "VimeoNetworking",
    platforms: [
        .iOS("10.3")
    ],
    products: [
        .library(
            name: "VimeoNetworking",
            targets: ["VimeoNetworking", "VimeoNetworkingObjC"]
        )
    ],
    targets: [
        .target(
            name: "VimeoNetworkingObjC",
            path: "Sources/Shared",
            sources: ["Objc_ExceptionCatcher.m"],
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath(".")
            ]
        ),
        .target(
            name: "VimeoNetworking",
            dependencies: ["VimeoNetworkingObjC"],
            path: "Sources/Shared",
            exclude: ["Objc_ExceptionCatcher.m", "Objc_ExceptionCatcher.h"],
            sources: ["*.swift"]
        )
    ],
    swiftLanguageVersions: [.v5]
) 