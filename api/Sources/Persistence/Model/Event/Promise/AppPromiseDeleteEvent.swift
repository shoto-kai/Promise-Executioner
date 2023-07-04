import Entity
import Fluent
import Foundation

final class AppPromiseDeleteEvent: Model {

    static let schema = "promise_delete_events"

    @ID(key: .id)
    var id: UUID?

    @Parent(key: "user_id")
    var user: User

    @Field(key: "promise_entity_id")
    var promiseEntityID: UUID

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    init() {}

    init(
        id: UUID? = nil,
        userID: User.IDValue,
        promiseEntityID: UUID,
        createdAt: Date? = nil
    ) {
        self.id = id
        self.$user.id = userID
        self.promiseEntityID = promiseEntityID
        self.createdAt = createdAt
    }
}
