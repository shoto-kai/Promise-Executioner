import Entity
import Fluent
import Foundation

final class SendUserMessagePenalty: Model {

    static let schema = "send_user_message_penalties"

    @ID(key: .id)
    var id: UUID?

    @Parent(key: "promise_id")
    var promise: AppPromise

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
        promiseID: AppPromise.IDValue,
        destineUserID: User.IDValue,
        amount: Int,
        note: String,
        message: String
    ) {
        self.id = id
        self.$promise.id = promiseID
        self.$destineUser.id = destineUserID
        self.amount = amount
        self.note = note
        self.message = message
    }
}

extension Entity.Penalty {
    func toSendUserMessagePenaltyModel(
        of promiseID: Entity.AppPromise.ID
    ) -> SendUserMessagePenalty? {
        guard
            case .sendUserMessage(
                let destine,
                let amount,
                let note,
                let message,
                _
            ) = self
        else {
            return nil
        }
        return .init(
            promiseID: promiseID.value,
            destineUserID: destine.id.value,
            amount: amount.value,
            note: note,
            message: message
        )
    }
}

extension SendUserMessagePenalty {
    var toEntity: Entity.Penalty {
        get throws {
            try .sendUserMessage(
                destine: destineUserEntity,
                amount: .init(amount),
                note: .init(note),
                message: .init(message),
                state: .unexecuted
            )
        }
    }

    private var destineUserEntity: Entity.User {
        get throws {
            try destineUser.toEntity
        }
    }
}
