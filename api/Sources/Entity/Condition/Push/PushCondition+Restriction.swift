import Foundation

extension PushCondition {
    public enum Restriction: Hashable, Codable {
        case deadline(at: Date)
    }
}
