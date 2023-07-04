import Entity
import Fluent
import Foundation

final class AppPromiseFulfillEvent: Model {

    static let schema = "promise_fulfill_events"

    @ID(key: .id)
    var id: UUID?

    @Field(key: "promise_entity_id")
    var promiseEntityID: UUID

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    init() {}

    init(
        id: UUID? = nil,
        promiseEntityID: UUID,
        createdAt: Date? = nil
    ) {
        self.id = id
        self.promiseEntityID = promiseEntityID
        self.createdAt = createdAt
    }
}
