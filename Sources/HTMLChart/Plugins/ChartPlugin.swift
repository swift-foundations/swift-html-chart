import Foundation

/// Protocol for Chart.js plugins
public protocol ChartPlugin: Sendable {
    var id: String { get }
    var enabled: Bool { get }

    func toJavaScript() -> String
    func toDictionary() -> [String: Any]
}

/// Default implementation for plugins
extension ChartPlugin {
    public var enabled: Bool { true }

    public func toJavaScript() -> String {
        // Default implementation returns empty object
        return "{}"
    }
}

/// Container for plugin options
public struct PluginOptions: Sendable {
    public let legend: LegendOptions?
    public let tooltip: TooltipOptions?
    public let title: TitleOptions?
    public let subtitle: SubtitleOptions?
    public let filler: FillerOptions?
    public let decimation: DecimationOptions?

    public init(
        legend: LegendOptions? = nil,
        tooltip: TooltipOptions? = nil,
        title: TitleOptions? = nil,
        subtitle: SubtitleOptions? = nil,
        filler: FillerOptions? = nil,
        decimation: DecimationOptions? = nil
    ) {
        self.legend = legend
        self.tooltip = tooltip
        self.title = title
        self.subtitle = subtitle
        self.filler = filler
        self.decimation = decimation
    }
}

extension PluginOptions {
    func toDictionary() -> [String: Any] {
        var dict: [String: Any] = [:]

        if let legend {
            dict["legend"] = legend.toDictionary()
        }
        if let tooltip {
            dict["tooltip"] = tooltip.toDictionary()
        }
        if let title {
            dict["title"] = title.toDictionary()
        }
        if let subtitle {
            dict["subtitle"] = subtitle.toDictionary()
        }
        if let filler {
            dict["filler"] = filler.toDictionary()
        }
        if let decimation {
            dict["decimation"] = decimation.toDictionary()
        }

        return dict
    }
}

/// Filler plugin options
public struct FillerOptions: Sendable {
    public let propagate: Bool?
    public let drawTime: DrawTime?

    public init(
        propagate: Bool? = true,
        drawTime: DrawTime? = .beforeDatasetsDraw
    ) {
        self.propagate = propagate
        self.drawTime = drawTime
    }
}

extension FillerOptions {
    func toDictionary() -> [String: Any] {
        var dict: [String: Any] = [:]

        if let propagate {
            dict["propagate"] = propagate
        }
        if let drawTime {
            dict["drawTime"] = drawTime.rawValue
        }

        return dict
    }
}

/// Draw time for plugins
public enum DrawTime: String, Sendable {
    case beforeDraw
    case beforeDatasetsDraw
    case beforeDatasetDraw
    case afterDatasetsDraw
    case afterDatasetDraw
    case afterDraw
}

/// Decimation plugin options
public struct DecimationOptions: Sendable {
    public let enabled: Bool?
    public let algorithm: DecimationAlgorithm?
    public let samples: Int?
    public let threshold: Int?

    public init(
        enabled: Bool? = false,
        algorithm: DecimationAlgorithm? = .minMax,
        samples: Int? = nil,
        threshold: Int? = nil
    ) {
        self.enabled = enabled
        self.algorithm = algorithm
        self.samples = samples
        self.threshold = threshold
    }
}

extension DecimationOptions {
    func toDictionary() -> [String: Any] {
        var dict: [String: Any] = [:]

        if let enabled {
            dict["enabled"] = enabled
        }
        if let algorithm {
            dict["algorithm"] = algorithm.rawValue
        }
        if let samples {
            dict["samples"] = samples
        }
        if let threshold {
            dict["threshold"] = threshold
        }

        return dict
    }
}

/// Decimation algorithms
public enum DecimationAlgorithm: String, Sendable {
    case minMax = "min-max"
    case lttb
}

/// Subtitle plugin options
public struct SubtitleOptions: Sendable {
    public let display: Bool?
    public let text: String?
    public let color: ChartColor?
    public let font: FontOptions?
    public let position: TitlePosition?
    public let padding: PaddingValue?
    public let fullSize: Bool?
    public let align: TitleAlign?

    public init(
        display: Bool? = false,
        text: String? = nil,
        color: ChartColor? = nil,
        font: FontOptions? = nil,
        position: TitlePosition? = .top,
        padding: PaddingValue? = nil,
        fullSize: Bool? = true,
        align: TitleAlign? = .center
    ) {
        self.display = display
        self.text = text
        self.color = color
        self.font = font
        self.position = position
        self.padding = padding
        self.fullSize = fullSize
        self.align = align
    }
}

extension SubtitleOptions {
    func toDictionary() -> [String: Any] {
        var dict: [String: Any] = [:]

        if let display {
            dict["display"] = display
        }
        if let text {
            dict["text"] = text
        }
        if let color {
            dict["color"] = color.value
        }
        if let font {
            dict["font"] = font.toDictionary()
        }
        if let position {
            dict["position"] = position.rawValue
        }
        if let padding {
            dict["padding"] = padding.jsValue
        }
        if let fullSize {
            dict["fullSize"] = fullSize
        }
        if let align {
            dict["align"] = align.rawValue
        }

        return dict
    }
}
