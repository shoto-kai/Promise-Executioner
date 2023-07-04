import Entity
import Foundation

extension AppPromise.Task {
    public struct AccomplishEvent: Hashable, Codable {

        public typealias ID = Identifier<Self>

        public var id: ID

        public var promsieID: AppPromise.ID

        public var task: AppPromise.Task

        public var at: Date

        public init(
            id: ID,
            promiseID: AppPromise.ID,
            task: AppPromise.Task,
            at: Date
        ) {
            self.id = id
            self.promsieID = promiseID
            self.task = task
            self.at = at
        }
    }
}
