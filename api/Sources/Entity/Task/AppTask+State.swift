import Foundation

extension AppTask {
    public enum State: Hashable, Codable {
        case incomplete
        case completed(at: Date)
        case failed(at: Date)
    }
}
