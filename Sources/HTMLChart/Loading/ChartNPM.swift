import Foundation
import HTML

/// NPM/self-hosted Chart.js loader
public struct ChartNPM: ChartLoader {
    public let path: String
    public let `defer`: Defer
    public let async: Async
    public let type: ScriptType?

    public init(
        path: String,
        defer: Defer = true,
        async: Async = false,
        type: ScriptType? = nil
    ) {
        self.path = path
        self.defer = `defer`
        self.async = async
        self.type = type
    }
}

extension ChartNPM {
    public var loadingStrategy: ChartLoadingStrategy {
        .npm(path: path)
    }

    public var body: some HTML.View {
        script(
            src: .init(path),
            async: async,
            defer: `defer`,
            type: type
        )
    }
}

/// ES Module loader for Chart.js
public struct ChartESM: ChartLoader {
    public let url: String
    public let integrity: Integrity?
    public let crossorigin: Crossorigin?

    public init(
        url: String = "https://cdn.jsdelivr.net/npm/chart.js@4/+esm",
        integrity: Integrity? = nil,
        crossorigin: Crossorigin? = "anonymous"
    ) {
        self.url = url
        self.integrity = integrity
        self.crossorigin = crossorigin
    }
}

extension ChartESM {
    public var loadingStrategy: ChartLoadingStrategy {
        .esm(url: url)
    }

    public var body: some HTML.View {
        script(type: .module) {
            """
            import Chart from '\(url)';
            window.Chart = Chart;
            """
        }
    }
}
