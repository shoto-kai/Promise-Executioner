import Entity
import Foundation

extension AppPromise {
    public struct FulfillEvent: Hashable, Codable {

        public typealias ID = Identifier<Self>

        public var id: ID

        public var promsieID: AppPromise.ID

        public var at: Date

        public init(
            id: ID,
            promiseID: AppPromise.ID,
            at: Date
        ) {
            self.id = id
            self.promsieID = promiseID
            self.at = at
        }
    }
}
