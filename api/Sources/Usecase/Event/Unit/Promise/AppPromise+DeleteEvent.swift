import Entity
import Foundation

extension AppPromise {
    public struct DeleteEvent: Hashable, Codable {

        public typealias ID = Identifier<Self>

        public var id: ID

        public var promiseID: AppPromise.ID

        public var at: Date

        public init(id: ID, promiseID: AppPromise.ID, at: Date) {
            self.id = id
            self.promiseID = promiseID
            self.at = at
        }

    }
}
