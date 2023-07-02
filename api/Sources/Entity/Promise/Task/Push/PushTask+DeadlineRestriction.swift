import Foundation

extension PushTask {
    public struct DeadlineRestriction: Hashable, Codable {

        public typealias ID = Identifier<Self>

        public var id: ID

        public var at: Date

        public init(id: ID, at: Date) {
            self.id = id
            self.at = at
        }

        func isExpired(now: Date) -> Bool {
            return at < now
        }
    }
}
