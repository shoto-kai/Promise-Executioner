import Foundation

extension PushTask {
    public struct DeadlineRestriction: Hashable, Codable {

        public var at: Date

        public init(_ at: Date) {
            self.at = at
        }

        func isExpired(now: Date) -> Bool {
            return at < now
        }
    }
}
