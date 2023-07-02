import Entity
import Fluent
import Foundation

final class AppTaskCreateEvent: Model {

    static let schema = "app_task_create_events"

    @ID(key: .id)
    var id: UUID?

    @Parent(key: "user_id")
    var user: User

    @Field(key: "title")
    var title: String

    @Field(key: "note")
    var note: String

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    init() {}

    init(
        id: UUID? = nil,
        userID: User.IDValue,
        title: String,
        note: String,
        createdAt: Date? = nil
    ) {
        self.id = id
        self.$user.id = userID
        self.title = title
        self.note = note
        self.createdAt = createdAt
    }
}
