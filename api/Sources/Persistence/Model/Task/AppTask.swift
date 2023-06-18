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

    // Notification Kind
    @Children(for: \.$task)
    var giftPairNotificationKinds: [GiftPairNotificationKind]

    @Children(for: \.$task)
    var penaltyPairNotificationKinds: [PenaltyPairNotificationKind]

    @Children(for: \.$task)
    var signPairNotificationKinds: [SignPairNotificationKind]

    @Children(for: \.$task)
    var terminatePairNotificationKind: [TerminatePairNotificationKind]

    // Penalty
    @Children(for: \.$task)
    var sendUserMessagePenalties: [SendUserMessagePenalty]

    // Restriction
    @OptionalChild(for: \.$task)
    var pushRestriction: PushRestriction?
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
    var toEntity: Entity.AppTask {
        get throws {
            guard
                let restriction = $pushRestriction.value.flatMap({ $0 }),
                let sendUserMessagePenalties = $sendUserMessagePenalties.value
            else {
                throw DBError.loadError
            }
            return try .init(
                id: .init(requireID()),
                title: title,
                note: note,
                state: .init(completedAt, failedAt),
                restriction: restriction.toEntity,
                penalties: sendUserMessagePenalties.map({ try $0.toEntity })
            )
        }
    }
}
