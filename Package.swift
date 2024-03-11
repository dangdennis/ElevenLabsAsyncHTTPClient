// swift-tools-version: 5.10
import PackageDescription

let package = Package(
  name: "eleven-labs-async-http-client",
  platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .visionOS(.v1)],

  products: [
    .library(
      name: "ElevenLabsAsyncHTTPClient",
      targets: ["ElevenLabsAsyncHTTPClient"]
    )
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-openapi-generator", from: "1.0.0"),
    .package(url: "https://github.com/apple/swift-openapi-runtime", from: "1.0.0"),
    .package(url: "https://github.com/swift-server/swift-openapi-async-http-client", from: "1.0.0"),
    // Generating for Vapor server side usage, so we use AsyncHTTPClient instead of URLSession.
    // .package(url: "https://github.com/apple/swift-openapi-urlsession", from: "1.0.0"),
  ],
  targets: [
    .target(
      name: "ElevenLabsAsyncHTTPClient",
      dependencies: [
        .product(name: "OpenAPIRuntime", package: "swift-openapi-runtime"),
        .product(name: "OpenAPIAsyncHTTPClient", package: "swift-openapi-async-http-client"),
        // .product(name: "OpenAPIURLSession", package: "swift-openapi-urlsession"),
      ],
      resources: [
        .process("openapi-generator-config.yaml"),
        .process("openapi.json"),
      ]
      // We don't use the plugin because we are checking in the generated code.
      // , plugins: [
      //   .plugin(name: "OpenAPIGenerator", package: "swift-openapi-generator")
      // ]
    ),
    .testTarget(
      name: "ElevenLabsAsyncHTTPClientTests",
      dependencies: [
        "ElevenLabsAsyncHTTPClient"
      ]
    ),
  ]
)
