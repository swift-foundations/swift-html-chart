// swift-tools-version: 5.10

import PackageDescription

extension String {
    static let htmlChart: Self = "HTMLChart"
}

extension Target.Dependency {
    static var htmlChart: Self { .target(name: .htmlChart) }
}

extension Target.Dependency {
    static var html: Self { .product(name: "HTML", package: "swift-html") }
}

let package = Package(
    name: "swift-html-chart",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
        .tvOS(.v17),
        .watchOS(.v10),
        .macCatalyst(.v17),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: .htmlChart,
            targets: [.htmlChart]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/swift-foundations/swift-html.git", branch: "main")
    ],
    targets: [
        .target(
            name: .htmlChart,
            dependencies: [
                .html
            ]
        ),
        .testTarget(
            name: .htmlChart.tests,
            dependencies: [
                .htmlChart
            ]
        )
    ],
    swiftLanguageModes: [.v5]
)

extension String {
    var tests: Self { "\(self) Tests" }
}
