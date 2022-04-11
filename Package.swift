// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "Heap_SwiftUI",
  platforms: [.iOS(.v13)],
  products: [
      .library(
          name: "Heap_SwiftUI",
          targets: ["Heap_SwiftUI"]
      )
  ],
  dependencies: [
    .package(url: "https://github.com/heap/heap-ios-sdk.git", from: "9.0.0-alpha.2"),
  ],
  targets: [
    .binaryTarget(
      name: "Heap_SwiftUI",
      url: "https://cdn.heapanalytics.com/ios/heap-swiftui-0.0.0-alpha.4.zip",
      checksum: "7372e5bc693ea2ae2214932eb831031394b81d4d482c2ad24dca81e9536af6cc"
    ),
  ]
)
