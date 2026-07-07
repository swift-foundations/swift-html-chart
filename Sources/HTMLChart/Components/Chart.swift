import Foundation
import HTML

/// Main chart component that renders a Chart.js chart
public struct Chart: HTML.View {
    public let id: String
    public let configuration: ChartConfiguration
    public let width: W3C_CSS_BoxModel.Width?
    public let height: W3C_CSS_BoxModel.Height?
    public let containerClass: Class?
    public let responsive: Bool
    public let storeGlobally: Bool

    public init(
        id: String? = nil,
        configuration: ChartConfiguration,
        width: W3C_CSS_BoxModel.Width? = nil,
        height: W3C_CSS_BoxModel.Height? = nil,
        containerClass: Class? = nil,
        responsive: Bool = true,
        storeGlobally: Bool = false
    ) {
        self.id = id ?? "chart-\(UUID().uuidString.prefix(8))"
        self.configuration = configuration
        self.width = width
        self.height = height
        self.containerClass = containerClass
        self.responsive = responsive
        self.storeGlobally = storeGlobally
    }
}

extension Chart {
    public var body: some HTML.View {
        div {
            canvas {}
                .id(id)
                .if(let: width) { canvas, width in
                    canvas.css.width(width)
                }
                .if(let: height) { canvas, height in
                    canvas.css.height(height)
                }

            ChartScript(
                chartId: id,
                configuration: configuration,
                storeGlobally: storeGlobally
            )
        }
        .if(let: containerClass) { div, containerClass in
            div.class(containerClass)
        }
        .if(!responsive) { div in
            div.css.inlineStyle("width", width?.description ?? "100%")
                .inlineStyle("height", height?.description ?? "400px")
        }
    }
}

/// Convenience chart components for common chart types
public struct LineChart: HTML.View {
    private let chart: Chart

    public init(
        id: String? = nil,
        data: ChartData,
        options: ChartOptions? = nil,
        width: W3C_CSS_BoxModel.Width? = nil,
        height: W3C_CSS_BoxModel.Height? = nil,
        storeGlobally: Bool = false
    ) {
        let config = ChartConfiguration(
            type: .line,
            data: data,
            options: options
        )
        self.chart = Chart(
            id: id,
            configuration: config,
            width: width,
            height: height,
            storeGlobally: storeGlobally
        )
    }
}

extension LineChart {
    public var body: some HTML.View {
        chart
    }
}

public struct BarChart: HTML.View {
    private let chart: Chart

    public init(
        id: String? = nil,
        data: ChartData,
        options: ChartOptions? = nil,
        width: W3C_CSS_BoxModel.Width? = nil,
        height: W3C_CSS_BoxModel.Height? = nil,
        horizontal: Bool = false
    ) {
        var finalOptions = options ?? ChartOptions()
        if horizontal {
            finalOptions = ChartOptions(
                responsive: finalOptions.responsive,
                maintainAspectRatio: finalOptions.maintainAspectRatio,
                plugins: finalOptions.plugins,
                scales: finalOptions.scales,
                indexAxis: .y
            )
        }

        let config = ChartConfiguration(
            type: .bar,
            data: data,
            options: finalOptions
        )
        self.chart = Chart(
            id: id,
            configuration: config,
            width: width,
            height: height
        )
    }
}

extension BarChart {
    public var body: some HTML.View {
        chart
    }
}

public struct PieChart: HTML.View {
    private let chart: Chart

    public init(
        id: String? = nil,
        data: ChartData,
        options: ChartOptions? = nil,
        width: W3C_CSS_BoxModel.Width? = nil,
        height: W3C_CSS_BoxModel.Height? = nil
    ) {
        let config = ChartConfiguration(
            type: .pie,
            data: data,
            options: options
        )
        self.chart = Chart(
            id: id,
            configuration: config,
            width: width,
            height: height
        )
    }
}

extension PieChart {
    public var body: some HTML.View {
        chart
    }
}

public struct DoughnutChart: HTML.View {
    private let chart: Chart

    public init(
        id: String? = nil,
        data: ChartData,
        options: ChartOptions? = nil,
        width: W3C_CSS_BoxModel.Width? = nil,
        height: W3C_CSS_BoxModel.Height? = nil
    ) {
        let config = ChartConfiguration(
            type: .doughnut,
            data: data,
            options: options
        )
        self.chart = Chart(
            id: id,
            configuration: config,
            width: width,
            height: height
        )
    }
}

extension DoughnutChart {
    public var body: some HTML.View {
        chart
    }
}

public struct RadarChart: HTML.View {
    private let chart: Chart

    public init(
        id: String? = nil,
        data: ChartData,
        options: ChartOptions? = nil,
        width: W3C_CSS_BoxModel.Width? = nil,
        height: W3C_CSS_BoxModel.Height? = nil
    ) {
        let config = ChartConfiguration(
            type: .radar,
            data: data,
            options: options
        )
        self.chart = Chart(
            id: id,
            configuration: config,
            width: width,
            height: height
        )
    }
}

extension RadarChart {
    public var body: some HTML.View {
        chart
    }
}

public struct PolarAreaChart: HTML.View {
    private let chart: Chart

    public init(
        id: String? = nil,
        data: ChartData,
        options: ChartOptions? = nil,
        width: W3C_CSS_BoxModel.Width? = nil,
        height: W3C_CSS_BoxModel.Height? = nil
    ) {
        let config = ChartConfiguration(
            type: .polarArea,
            data: data,
            options: options
        )
        self.chart = Chart(
            id: id,
            configuration: config,
            width: width,
            height: height
        )
    }
}

extension PolarAreaChart {
    public var body: some HTML.View {
        chart
    }
}

public struct BubbleChart: HTML.View {
    private let chart: Chart

    public init(
        id: String? = nil,
        data: ChartData,
        options: ChartOptions? = nil,
        width: W3C_CSS_BoxModel.Width? = nil,
        height: W3C_CSS_BoxModel.Height? = nil
    ) {
        let config = ChartConfiguration(
            type: .bubble,
            data: data,
            options: options
        )
        self.chart = Chart(
            id: id,
            configuration: config,
            width: width,
            height: height
        )
    }
}

extension BubbleChart {
    public var body: some HTML.View {
        chart
    }
}

public struct ScatterChart: HTML.View {
    private let chart: Chart

    public init(
        id: String? = nil,
        data: ChartData,
        options: ChartOptions? = nil,
        width: W3C_CSS_BoxModel.Width? = nil,
        height: W3C_CSS_BoxModel.Height? = nil
    ) {
        let config = ChartConfiguration(
            type: .scatter,
            data: data,
            options: options
        )
        self.chart = Chart(
            id: id,
            configuration: config,
            width: width,
            height: height
        )
    }
}

extension ScatterChart {
    public var body: some HTML.View {
        chart
    }
}
