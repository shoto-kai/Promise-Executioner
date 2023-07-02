import Entity
import Fluent
import Foundation

final class AppTaskUpdateEvent: Model {

    static let schema = "app_task_update_events"

    @ID(key: .id)
    var id: UUID?

    @Parent(key: "task_id")
    var createEvent: AppTaskCreateEvent

    @Field(key: "title")
    var title: String

    @Field(key: "note")
    var note: String

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    init() {}

    init(
        id: UUID? = nil,
        createEventID: AppTaskCreateEvent.IDValue,
        title: String,
        note: String,
        createdAt: Date? = nil
    ) {
        self.id = id
        self.$createEvent.id = createEventID
        self.title = title
        self.note = note
        self.createdAt = createdAt
    }
}
