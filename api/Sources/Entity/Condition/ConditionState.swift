import Foundation

public enum ConditionState: Hashable, Codable {
    case incomplete
    case completed(at: Date)
    case failed(at: Date)
}
