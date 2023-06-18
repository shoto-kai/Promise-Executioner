import Foundation

extension Penalty {
    public enum State: Hashable, Codable {
        case executed(at: Date)
        case unexecuted
    }
}
