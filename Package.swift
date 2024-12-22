// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TreeSitterPuppet",
    products: [
        .library(name: "TreeSitterPuppet", targets: ["TreeSitterPuppet"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ChimeHQ/SwiftTreeSitter", from: "0.8.0"),
    ],
    targets: [
        .target(
            name: "TreeSitterPuppet",
            dependencies: [],
            path: ".",
            sources: [
                "src/parser.c",
            ],
            resources: [
                .copy("queries")
            ],
            publicHeadersPath: "bindings/swift",
            cSettings: [.headerSearchPath("src")]
        ),
        .testTarget(
            name: "TreeSitterPuppetTests",
            dependencies: [
                "SwiftTreeSitter",
                "TreeSitterPuppet",
            ],
            path: "bindings/swift/TreeSitterPuppetTests"
        )
    ],
    cLanguageStandard: .c11
)
