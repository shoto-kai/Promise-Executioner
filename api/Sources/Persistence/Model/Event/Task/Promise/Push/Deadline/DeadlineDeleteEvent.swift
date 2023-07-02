import Entity
import Fluent
import Foundation

extension PushPromiseCreateEvent {
    final class DeadlineDeleteEvent: Model {

        static let schema = "push_promise_deadline_delete_events"

        @ID(key: .id)
        var id: UUID?

        @Parent(key: "push_promise_create_event_id")
        var createEvent: DeadlineCreateEvent

        @Timestamp(key: "created_at", on: .create)
        var createdAt: Date?

        init() {}

        init(
            id: UUID? = nil,
            createEventID: DeadlineCreateEvent.IDValue,
            createdAt: Date? = nil
        ) {
            self.id = id
            self.$createEvent.id = createEventID
            self.createdAt = createdAt
        }
    }
}
