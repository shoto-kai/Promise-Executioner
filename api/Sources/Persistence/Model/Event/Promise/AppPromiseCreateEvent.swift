import Entity
import Fluent
import Foundation

final class AppPromiseCreateEvent: Model {

    static let schema = "promise_create_events"

    @ID(key: .id)
    var id: UUID?

    @Parent(key: "user_id")
    var user: User

    @Parent(key: "promise_id")
    var promise: AppPromise

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    init() {}

    init(
        id: UUID? = nil,
        userID: User.IDValue,
        promiseID: AppPromise.IDValue,
        createdAt: Date? = nil
    ) {
        self.id = id
        self.$user.id = userID
        self.$promise.id = promiseID
        self.createdAt = createdAt
    }
}
