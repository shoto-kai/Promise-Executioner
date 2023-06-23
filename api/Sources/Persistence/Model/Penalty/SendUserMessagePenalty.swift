import Entity
import Fluent
import Foundation

final class SendUserMessagePenalty: Model {

    static let schema = "send_user_message_penalties"

    @ID(key: .id)
    var id: UUID?

    @Parent(key: "task_id")
    var task: AppTask

    @Parent(key: "destine_user_id")
    var destineUser: User

    @Field(key: "amount")
    var amount: Int

    @Field(key: "note")
    var note: String

    @Field(key: "message")
    var message: String

    @Field(key: "executed_at")
    var executedAt: Date?

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?

    init() {}

    init(
        id: UUID? = nil,
        taskID: AppTask.IDValue,
        destinUserID: User.IDValue,
        amount: Int,
        note: String,
        message: String,
        executedAt: Date? = nil
    ) {
        self.id = id
        self.$task.id = taskID
        self.$destineUser.id = destinUserID
        self.amount = amount
        self.note = note
        self.message = message
        self.executedAt = executedAt
    }
}

extension SendUserMessagePenalty {
    var toEntity: Entity.Penalty {
        get throws {
            guard let destine = $destineUser.value else {
                throw DBError.loadError
            }
            return try .sendUserMessage(
                destine: destine.toEntity,
                amount: .init(amount),
                note: note,
                message: message,
                state: .init(executedAt)
            )
        }
    }
}

extension Penalty {
    func toSendUserMessagePenalties(of taskID: AppTask.IDValue) -> SendUserMessagePenalty? {
        guard
            case .sendUserMessage(
                let destine,
                let amount,
                let note,
                let message,
                let state
            ) = self
        else {
            return nil
        }
        return .init(
            taskID: taskID,
            destinUserID: destine.id.value,
            amount: amount.value,
            note: note,
            message: message,
            executedAt: state.executedAt
        )
    }
}
