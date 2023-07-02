import Entity
import Fluent
import Foundation

final class SendUserMessagePenaltyUpdateEvent: Model {

    static let schema = "send_user_message_penalty_update_events"

    @ID(key: .id)
    var id: UUID?

    @Parent(key: "send_user_message_penalty_create_event_id")
    var createEvent: SendUserMessagePenaltyCreateEvent

    @Parent(key: "destine_user_id")
    var destineUser: User

    @Field(key: "amount")
    var amount: Int

    @Field(key: "note")
    var note: String

    @Field(key: "message")
    var message: String

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    init() {}

    init(
        id: UUID? = nil,
        createEventID: SendUserMessagePenaltyCreateEvent.IDValue,
        destineUserID: User.IDValue,
        amount: Int,
        note: String,
        message: String,
        createdAt: Date? = nil
    ) {
        self.id = id
        self.$createEvent.id = createEventID
        self.$destineUser.id = destineUserID
        self.amount = amount
        self.note = note
        self.message = message
        self.createdAt = createdAt
    }
}
