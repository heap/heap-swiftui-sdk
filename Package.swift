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
    .package(url: "https://github.com/heap/heap-ios-sdk.git", from: "9.0.0-alpha.1"),
  ],
  targets: [
    .binaryTarget(
      name: "Heap_SwiftUI",
      url: "https://cdn.heapanalytics.com/ios/heap-swiftui-0.0.0-alpha.3.zip",
      checksum: "f9082aeac754338e3ed8b867389fac05e3c892fc0b673471a82717c1bae8ea32"
    ),
  ]
)
