import Entity
import Fluent
import Foundation

extension PushPromiseCreateEvent {
    final class DeadlineCreateEvent: Model {

        static let schema = "push_promise_deadline_create_events"

        @ID(key: .id)
        var id: UUID?

        @Parent(key: "push_promise_create_event_id")
        var promiseCreateEvent: PushPromiseCreateEvent

        @Field(key: "deadline")
        var deadline: Date

        @Timestamp(key: "created_at", on: .create)
        var createdAt: Date?

        init() {}

        init(
            id: UUID? = nil,
            promiseCreateEventID: PushPromiseCreateEvent.IDValue,
            deadline: Date,
            createdAt: Date? = nil
        ) {
            self.id = id
            self.$promiseCreateEvent.id = promiseCreateEventID
            self.deadline = deadline
            self.createdAt = createdAt
        }
    }
}
