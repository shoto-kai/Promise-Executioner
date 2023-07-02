import Foundation

extension AppPromise {
    public enum State: Hashable, Codable {
        case incomplete
        case completed(at: Date)
        case failed(at: Date)
    }
}
