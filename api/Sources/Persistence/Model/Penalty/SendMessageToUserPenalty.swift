import Entity
import Fluent
import Foundation

final class SendMessageToUserPenalty: Model {

    static let schema = "send_message_to_user_penalties"

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

extension Entity.SendMessageToUserPenalty {

    func toModel(
        of taskID: Entity.AppTask.ID
    ) -> Persistence.SendMessageToUserPenalty {
        .init(
            id: id.value,
            taskID: taskID.value,
            destinUserID: destine.id.value,
            amount: amount,
            note: note,
            message: message,
            executedAt: executedAt
        )
    }
}

extension SendMessageToUserPenalty {
    /// - with destineUser
    var toEntity: Entity.SendMessageToUserPenalty {
        get throws {
            guard let destine = $destineUser.value else {
                fatalError("宛先ユーザーを取得済みである必要がある")
            }
            return try .init(
                id: .init(requireID()),
                destine: try destine.toEntity,
                amount: amount,
                note: note,
                message: message,
                executedAt: executedAt
            )
        }
    }
}
