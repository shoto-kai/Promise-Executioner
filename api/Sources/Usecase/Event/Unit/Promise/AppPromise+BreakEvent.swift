import Entity
import Foundation

extension AppPromise {
    public struct BreakEvent: Hashable, Codable {

        public typealias ID = Identifier<Self>

        public var id: ID

        public var user: User

        public var promiseID: AppPromise.ID

        public var at: Date

        public init(
            id: ID,
            user: User,
            promiseID: AppPromise.ID,
            at: Date
        ) {
            self.id = id
            self.user = user
            self.promiseID = promiseID
            self.at = at
        }
    }
}
