// swift-tools-version:5.9

import PackageDescription

let package = Package(
  name: "ShopifyAPIKit",
  platforms: [
    .iOS(.v12),
    .macOS(.v10_14),
    .tvOS(.v12),
    .watchOS(.v5),
  ],
  products: [
    .library(name: "ShopifyAPIKit", targets: ["ShopifyAPIKit"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apollographql/apollo-ios", exact: "1.17.0"),
  ],
  targets: [
    .target(
      name: "ShopifyAPIKit",
      dependencies: [
        .product(name: "ApolloAPI", package: "apollo-ios"),
      ],
      path: "./Sources"
    ),
  ]
)
