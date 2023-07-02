import Entity
import Fluent
import Foundation

final class PushPromiseCreateEvent: Model {

    static let schema = "push_promise_create_events"

    @ID(key: .id)
    var id: UUID?

    @Parent(key: "app_task_create_event_id")
    var taskCreateEvent: AppTaskCreateEvent

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    init() {}

    init(
        id: UUID? = nil,
        taskCreateEventID: AppTaskCreateEvent.IDValue,
        createdAt: Date? = nil
    ) {
        self.id = id
        self.$taskCreateEvent.id = taskCreateEventID
        self.createdAt = createdAt
    }
}
