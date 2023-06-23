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

    @OptionalChild(for: \.$notification)
    var gift: GiftPairNotificationKind?

    @OptionalChild(for: \.$notification)
    var penalty: PenaltyPairNotificationKind?

    @OptionalChild(for: \.$notification)
    var sign: SignPairNotificationKind?

    @OptionalChild(for: \.$notification)
    var terminate: TerminatePairNotificationKind?
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
                readState: .init(at: readAt)
            )
        }
    }

    private var kind: NotificationKind {
        get throws {
            if let giftKind = try $gift.value.flatMap({ try $0?.toEntity }) {
                return giftKind
            }
            if let penaltyKind = try $penalty.value.flatMap({ try $0?.toEntity }) {
                return penaltyKind
            }
            if let signKind = try $sign.value.flatMap({ try $0?.toEntity }) {
                return signKind
            }
            if let terminateKind = try $terminate.value.flatMap({ try $0?.toEntity }) {
                return terminateKind
            }
            throw DBError.loadError
        }
    }
}
