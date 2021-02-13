// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SPMTest",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SPMTest",
            type: .dynamic,
            targets: ["SPMTest"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/ReactiveX/RxSwift.git",
            from: Version.init(stringLiteral: "6.1.0")
        ),
        .package(
            url: "https://github.com/RxSwiftCommunity/Action.git",
            from: .init(stringLiteral: "4.2.0")
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SPMTest",
            dependencies: [
                "RxSwift",
                .product(name: "RxCocoa", package: "RxSwift"),
                .product(name: "RxRelay", package: "RxSwift"),
                "Action"
            ]),
        .testTarget(
            name: "SPMTestTests",
            dependencies: ["SPMTest",
                           .product(name: "RxTest", package: "RxSwift"),
                           .product(name: "RxBlocking", package: "RxSwift")]),
    ]
)
