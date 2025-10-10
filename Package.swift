// swift-tools-version:5.3
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
        .package(
            name: "Sodium",
            url: "https://github.com/martiall/swift-sodium.git",
            .branch("master")
        ),
        .package(url: "https://github.com/apple/swift-crypto.git", from: "3.15.0"),
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
                .product(name: "Clibsodium", package: "Sodium"),
                .product(name: "Sodium", package: "Sodium"),
                .product(name: "Crypto", package: "swift-crypto"),
                .product(name: "CryptoSwift", package: "CryptoSwift"),
                .product(name: "TypedJSON", package: "TypedJSON")
            ]
        ),
        .testTarget(
            name: "PasetoTests",
            dependencies: [
                .target(name: "Paseto"),
                .product(name: "Crypto", package: "swift-crypto"),
            ],
            resources: [
                .copy("TestVectors")
            ]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
