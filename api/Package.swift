// swift-tools-version:5.8
import PackageDescription

let package = Package(
    name: "api",
    platforms: [
        .macOS(.v13)
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.76.0"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.8.0"),
        .package(url: "https://github.com/vapor/fluent-postgres-driver.git", from: "2.0.0"),
    ],
    targets: [
        .executableTarget(
            name: "App",
            dependencies: [
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentPostgresDriver", package: "fluent-postgres-driver"),
                .product(name: "Vapor", package: "vapor"),
                .target(name: "Persistence")
            ],
            swiftSettings: [
                // Enable better optimizations when building in Release configuration. Despite the use of
                // the `.unsafeFlags` construct required by SwiftPM, this flag is recommended for Release
                // builds. See <https://www.swift.org/server/guides/building.html#building-for-production> for details.
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
            ]
        ),
        .testTarget(name: "AppTests", dependencies: [
            .target(name: "App"),
            .product(name: "XCTVapor", package: "vapor"),
        ]),
        
        .target(name: "ServiceAuth", dependencies: [
            .target(name: "Usecase"),
            .target(name: "Entity"),
            .target(name: "Repository"),
            .target(name: "ServiceProtocol"),
        ], path: "Sources/Service/Auth"),
        
        .target(name: "ServiceApp", dependencies: [
            .target(name: "Usecase"),
            .target(name: "Entity"),
            .target(name: "Repository"),
            .target(name: "ServiceProtocol"),
        ], path: "Sources/Service/App"),
        
        .target(name: "ServiceProtocol", dependencies: [
            .target(name: "Entity"),
            .target(name: "Usecase"),
            .target(name: "Repository"),
        ], path: "Sources/Service/Protocol"),
    
        .target(name: "Persistence", dependencies: [
            .target(name: "Entity"),
            .target(name: "Usecase"),
            .target(name: "Repository"),
            .product(name: "Fluent", package: "fluent"),
        ]),
        .testTarget(name: "PersistenceTests", dependencies: [
            .target(name: "Persistence"),
            .product(name: "Vapor", package: "vapor"),
            .target(name: "App"),
            .target(name: "Testing"),
        ]),
        
        .target(name: "Repository", dependencies: [
            .target(name: "Entity"),
            .target(name: "Usecase"),
        ]),
    
        .target(name: "Usecase", dependencies: [
            .target(name: "Entity"),
        ]),
        .testTarget(name: "UsecaseTests", dependencies: [
            .target(name: "Usecase"),
            .target(name: "Testing"),
        ]),
        
        .target(name: "Entity"),
        .testTarget(name: "EntityTests", dependencies: [
            .target(name: "Entity"),
            .target(name: "Testing"),
        ]),
        
        .target(name: "Testing", dependencies: [
            .target(name: "Entity"),
            .target(name: "Usecase"),
            .target(name: "Repository"),
            .target(name: "Persistence"),
        ]),
    ]
)
