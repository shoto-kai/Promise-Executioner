import Entity
import Foundation

extension AppPromise {
    public struct UpdateEvent: Hashable, Codable {

        public typealias ID = Identifier<Self>

        public var id: ID

        public var promise: AppPromise

        public var at: Date

        public init(id: ID, promise: AppPromise, at: Date) {
            self.id = id
            self.promise = promise
            self.at = at
        }
    }
}
