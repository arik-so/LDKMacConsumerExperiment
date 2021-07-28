// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LDKMacConsumerExperiment",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(name: "LDKMacConsumerExperiment",
                dependencies: [
                    // .byName(name: "LDKFramework")
                ],
                path: nil,
                exclude: [],
                sources: nil,
                resources: nil,
                publicHeadersPath: nil,
                cSettings: [
                    .headerSearchPath(""),
                ],
                cxxSettings: nil,
                swiftSettings: nil,
                linkerSettings: [
                    .linkedLibrary("libldk.a")
                ]),
        .testTarget(
            name: "LDKMacConsumerExperimentTests",
            dependencies: ["LDKMacConsumerExperiment"]),
//        .binaryTarget(
//            name: "LDKFramework",
//            path: "LDKFrameworkMac.xcframework"
//        ),
        // .systemLibrary(name: "libldk", path: "Sources/libldk", pkgConfig: nil, providers: nil)
    ]
)
