import Entity
import Fluent
import Foundation

final class AppTaskDeleteEvent: Model {

    static let schema = "app_task_delete_events"

    @ID(key: .id)
    var id: UUID?

    @Parent(key: "task_id")
    var createEvent: AppTaskCreateEvent

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    init() {}

    init(
        id: UUID? = nil,
        createEventID: AppTaskCreateEvent.IDValue,
        createdAt: Date? = nil
    ) {
        self.id = id
        self.$createEvent.id = createEventID
        self.createdAt = createdAt
    }
}
