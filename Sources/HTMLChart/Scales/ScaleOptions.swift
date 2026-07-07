import Foundation

/// Container for all scales in a chart
public struct ScaleOptions: Sendable {
    // Heterogeneous collection: a chart legitimately mixes concrete scale kinds
    // (linear/category/time/etc.) keyed by axis id; no non-existential shape
    // expresses that.
    // swiftlint:disable:next no_any_protocol_existential
    public let scales: [String: any Scale]

    // Heterogeneous collection — see `scales` above.
    // swiftlint:disable:next no_any_protocol_existential
    public init(scales: [String: any Scale] = [:]) {
        self.scales = scales
    }

    // Heterogeneous collection — see `scales` above.
    // swiftlint:disable no_any_protocol_existential
    /// Convenience initializer for common x/y scales
    public init(x: (any Scale)? = nil, y: (any Scale)? = nil) {
        var scales: [String: any Scale] = [:]
        if let x {
            scales["x"] = x
        }
        if let y {
            scales["y"] = y
        }
        self.scales = scales
    }
    // swiftlint:enable no_any_protocol_existential

    // Heterogeneous collection — see `scales` above.
    // swiftlint:disable no_any_protocol_existential
    /// Add a scale with a custom ID
    public func adding(_ scale: any Scale, withId id: String) -> Self {
        var newScales = scales
        newScales[id] = scale
        return Self(scales: newScales)
    }
    // swiftlint:enable no_any_protocol_existential

    func toDictionary() -> [String: Any] {
        var dict: [String: Any] = [:]

        for (id, scale) in scales {
            dict[id] = scale.toDictionary()
        }

        return dict
    }
}

/// Builder for creating scale configurations
public struct ScaleBuilder {
    // Heterogeneous collection: a chart legitimately mixes concrete scale kinds
    // (linear/category/time/etc.) keyed by axis id; no non-existential shape
    // expresses that.
    // swiftlint:disable no_any_protocol_existential
    private var scales: [String: any Scale] = [:]

    public init() {}

    public func x(_ scale: any Scale) -> Self {
        var builder = self
        builder.scales["x"] = scale
        return builder
    }

    public func y(_ scale: any Scale) -> Self {
        var builder = self
        builder.scales["y"] = scale
        return builder
    }

    public func r(_ scale: any Scale) -> Self {
        var builder = self
        builder.scales["r"] = scale
        return builder
    }

    public func custom(_ id: String, scale: any Scale) -> Self {
        var builder = self
        builder.scales[id] = scale
        return builder
    }
    // swiftlint:enable no_any_protocol_existential

    public func build() -> ScaleOptions {
        ScaleOptions(scales: scales)
    }
}
