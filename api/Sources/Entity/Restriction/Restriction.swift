import Foundation

public enum Restriction: Hashable, Codable {
    case push(deadline: Date?)
}

extension Restriction {
    public func isExpired(now: Date) -> Bool {
        each.isExpired(now: now)
    }
}

extension Restriction {
    private var each: RestrictionCase {
        switch self {
        case .push(let deadline):
            return PushRestrictionCase(deadline: deadline)
        }
    }
}
