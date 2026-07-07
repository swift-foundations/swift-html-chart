// swift-tools-version: 6.0

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
        .macOS("26.0"),
        .iOS("26.0"),
        .tvOS("26.0"),
        .watchOS("26.0"),
        .macCatalyst("26.0"),
        .visionOS("26.0")
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
    swiftLanguageModes: [.v6]
)

extension String {
    var tests: Self { "\(self) Tests" }
}