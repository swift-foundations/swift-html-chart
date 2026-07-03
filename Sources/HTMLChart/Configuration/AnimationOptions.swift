import Foundation

/// Configuration for chart animations
public struct AnimationOptions: Sendable {
    public let duration: Int?
    public let easing: AnimationEasing?
    public let delay: Int?
    public let loop: Bool?
    public let animateRotate: Bool?
    public let animateScale: Bool?
    public let onProgress: String?  // JavaScript callback as string
    public let onComplete: String?  // JavaScript callback as string

    public init(
        duration: Int? = 1000,
        easing: AnimationEasing? = .easeOutQuart,
        delay: Int? = 0,
        loop: Bool? = false,
        animateRotate: Bool? = true,
        animateScale: Bool? = true,
        onProgress: String? = nil,
        onComplete: String? = nil
    ) {
        self.duration = duration
        self.easing = easing
        self.delay = delay
        self.loop = loop
        self.animateRotate = animateRotate
        self.animateScale = animateScale
        self.onProgress = onProgress
        self.onComplete = onComplete
    }

    /// Create animation options with no animation
    public static var none: Self {
        Self(duration: 0)
    }

    func toDictionary() -> [String: Any] {
        var dict: [String: Any] = [:]

        if let duration {
            dict["duration"] = duration
        }
        if let easing {
            dict["easing"] = easing.rawValue
        }
        if let delay {
            dict["delay"] = delay
        }
        if let loop {
            dict["loop"] = loop
        }
        if let animateRotate {
            dict["animateRotate"] = animateRotate
        }
        if let animateScale {
            dict["animateScale"] = animateScale
        }
        if let onProgress {
            dict["onProgress"] = onProgress
        }
        if let onComplete {
            dict["onComplete"] = onComplete
        }

        return dict
    }
}

/// Easing functions for animations
public enum AnimationEasing: String, Sendable, CaseIterable {
    case linear
    case easeInQuad
    case easeOutQuad
    case easeInOutQuad
    case easeInCubic
    case easeOutCubic
    case easeInOutCubic
    case easeInQuart
    case easeOutQuart
    case easeInOutQuart
    case easeInQuint
    case easeOutQuint
    case easeInOutQuint
    case easeInSine
    case easeOutSine
    case easeInOutSine
    case easeInExpo
    case easeOutExpo
    case easeInOutExpo
    case easeInCirc
    case easeOutCirc
    case easeInOutCirc
    case easeInElastic
    case easeOutElastic
    case easeInOutElastic
    case easeInBack
    case easeOutBack
    case easeInOutBack
    case easeInBounce
    case easeOutBounce
    case easeInOutBounce
}
