// swift-tools-version:6.2
//
//  Package.swift
//  Paseto
//
//  Created by Aidan Woods on 04/03/2018.
//  Copyright © 2017 Aidan Woods. All rights reserved.
//


import PackageDescription


let package = Package(
    name: "Paseto",
    platforms: [
        // Same baseline as CryptoSwift
        // Increased iOS, tvOS and watchOS because of ISO8601DateFormatter
        .macOS(.v10_12), .iOS(.v10), .tvOS(.v10), .watchOS(.v3)
    ],
    products: [
        .library(name: "Paseto", targets: ["Paseto"]),
    ],
    dependencies: [
        .package(url: "https://github.com/martiall/swift-sodium", branch: "master"),
        .package(
            url: "https://github.com/krzyzanowskim/CryptoSwift.git",
            .upToNextMajor(from: "1.4.2")
        ),
        .package(
            url: "https://github.com/aidantwoods/TypedJSON.git",
            .upToNextMinor(from: "0.1.2")
        )
    ],
    targets: [
        .target(
            name: "Paseto",
            dependencies: [
                .product(name: "Clibsodium", package: "swift-sodium"),
                .product(name: "Sodium", package: "swift-sodium"),
                "CryptoSwift",
                "TypedJSON"
            ]
        ),
        .testTarget(
            name: "PasetoTests",
            dependencies: ["Paseto"],
            resources: [
                .copy("TestVectors")
            ]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
