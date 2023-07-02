import Entity
import Fluent
import Foundation

final class PushPromiseDeleteEvent: Model {

    static let schema = "push_promise_delete_events"

    @ID(key: .id)
    var id: UUID?

    @Parent(key: "push_promise_create_event_id")
    var createEvent: PushPromiseCreateEvent

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    init() {}

    init(
        id: UUID? = nil,
        createEventID: PushPromiseCreateEvent.IDValue,
        createdAt: Date? = nil
    ) {
        self.id = id
        self.$createEvent.id = createEventID
        self.createdAt = createdAt
    }
}
