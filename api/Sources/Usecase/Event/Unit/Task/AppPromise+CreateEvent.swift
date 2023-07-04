import Entity
import Foundation

extension AppPromise {
    public struct CreateEvent: Hashable, Codable {

        public typealias ID = Identifier<Self>

        public var id: ID

        public var user: User

        public var promise: AppPromise

        public var at: Date

        public init(id: ID, user: User, promise: AppPromise, at: Date) {
            self.id = id
            self.user = user
            self.promise = promise
            self.at = at
        }
    }
}
