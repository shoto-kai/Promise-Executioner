import Entity
import Fluent
import Foundation

extension PushPromiseCreateEvent {
    final class DeadlineUpdateEvent: Model {

        static let schema = "push_promise_deadline_update_events"

        @ID(key: .id)
        var id: UUID?

        @Parent(key: "push_promise_create_event_id")
        var createEvent: DeadlineCreateEvent

        @Field(key: "deadline")
        var deadline: Date

        @Timestamp(key: "created_at", on: .create)
        var createdAt: Date?

        init() {}

        init(
            id: UUID? = nil,
            createEventID: DeadlineCreateEvent.IDValue,
            deadline: Date,
            createdAt: Date? = nil
        ) {
            self.id = id
            self.$createEvent.id = createEventID
            self.deadline = deadline
            self.createdAt = createdAt
        }
    }
}
