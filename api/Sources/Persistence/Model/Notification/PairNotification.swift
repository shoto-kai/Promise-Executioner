import Entity
import Fluent
import Foundation

final class PairNotification: Model {

    static let schema = "pair_notifications"

    @ID(key: .id)
    var id: UUID?

    @Parent(key: "from_user_id")
    var from: User

    @Parent(key: "to_user_id")
    var to: User

    @Field(key: "title")
    var title: String

    @Field(key: "noticed_at")
    var noticedAt: Date

    @Field(key: "read_at")
    var readAt: Date?

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?

    init() {}

    init(
        id: UUID? = nil,
        fromUserID: User.IDValue,
        toUserID: User.IDValue,
        title: String,
        noticedAt: Date,
        readAt: Date? = nil
    ) {
        self.id = id
        self.$from.id = fromUserID
        self.$to.id = toUserID
        self.title = title
        self.noticedAt = noticedAt
        self.readAt = readAt
    }
}

extension Entity.PairNotification {
    var toModel: Persistence.PairNotification {
        .init(
            id: id.value,
            fromUserID: from.id.value,
            toUserID: to.id.value,
            title: title,
            noticedAt: noticedAt,
            readAt: readState.readAt
        )
    }
}

extension PairNotification {
    var toEntity: Entity.PairNotification {
        get throws {
            guard
                let from = $from.value,
                let to = $to.value
            else {
                fatalError("fromとtoがloadされていない")
            }
            return try .init(
                id: .init(requireID()),
                from: from.toEntity,
                to: to.toEntity,
                kind: kind,
                title: title,
                noticedAt: noticedAt,
                readAt: readAt
            )
        }
    }
}
