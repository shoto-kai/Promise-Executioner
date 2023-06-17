import Entity
import Fluent
import Foundation

final class AppTask: Model {

    static let schema = "tasks"

    @ID(key: .id)
    var id: UUID?

    @Parent(key: "user_id")
    var user: User

    @Field(key: "title")
    var title: String

    @Field(key: "note")
    var note: String

    @Field(key: "completed_at")
    var completedAt: Date?

    @Field(key: "failed_at")
    var failedAt: Date?

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?

    init() {}

    init(
        id: UUID? = nil,
        userID: User.IDValue,
        title: String,
        note: String,
        completedAt: Date?,
        failedAt: Date?
    ) {
        self.id = id
        self.$user.id = userID
        self.title = title
        self.note = note
        self.completedAt = completedAt
        self.failedAt = failedAt
    }

    @Children(for: \.$task)
    var sendMessageToUserPenalties: [SendMessageToUserPenalty]

    @Children(for: \.$task)
    var pushConditions: [PushCondition]
}

extension Entity.AppTask {
    func toModel(of userID: Entity.User.ID) -> Persistence.AppTask {
        .init(
            id: id.value,
            userID: userID.value,
            title: title,
            note: note,
            completedAt: state.completedAt,
            failedAt: state.failedAt
        )
    }
}

extension AppTask {
    /// - with sendMessageToUserPenalties
    /// - with pushConditions
    var toEntity: Entity.AppTask {
        get throws {
            guard
                let pushes = $pushConditions.value,
                let sends = $sendMessageToUserPenalties.value
            else {
                fatalError("ロード不足")
            }

            return try .init(
                id: .init(requireID()),
                title: title,
                note: note,
                state: .init(completedAt, failedAt),
                conditions: .init(pushes: pushes.map { try $0.toEntity }),
                penalties: .init(sendMessageToUser: sends.map { try $0.toEntity })
            )
        }
    }
}
