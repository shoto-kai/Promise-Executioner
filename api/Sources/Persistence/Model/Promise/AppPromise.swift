import Entity
import Fluent
import Foundation

final class AppPromise: Model {

    static let schema = "promises"

    @ID(key: .id)
    var id: UUID?

    @Parent(key: "user_id")
    var user: User

    @Field(key: "entity_id")
    var entityID: UUID

    @Field(key: "title")
    var title: String

    @Field(key: "note")
    var note: String

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    init() {}

    init(
        id: UUID? = nil,
        userID: User.IDValue,
        entityID: UUID,
        title: String,
        note: String
    ) {
        self.id = id
        self.$user.id = userID
        self.entityID = entityID
        self.title = title
        self.note = note
    }

    @OptionalChild(for: \.$promise)
    var pushTask: PushTask?

    @Children(for: \.$promise)
    var sendUserMessagePenalties: [SendUserMessagePenalty]
}

extension Entity.AppPromise {
    func toModel(of userID: Entity.User.ID) -> AppPromise {
        .init(
            userID: userID.value,
            entityID: id.value,
            title: title,
            note: note
        )
    }
}

extension AppPromise {
    var toEntity: Entity.AppPromise {
        get throws {
            try .init(
                id: .init(entityID),
                title: title,
                note: note,
                state: .incomplete,
                task: taskEntity,
                penalties: penaltiesEntity
            )
        }
    }

    private var taskEntity: Entity.AppPromise.Task {
        get throws {
            if let pushTask {
                return pushTask.toEntity
            }
            throw DBError.illegalValue
        }
    }

    private var penaltiesEntity: [Entity.Penalty] {
        get throws {
            try sendUserMessagePenaltiesEntity
        }
    }

    private var sendUserMessagePenaltiesEntity: [Entity.Penalty] {
        get throws {
            try sendUserMessagePenalties.map { try $0.toEntity }
        }
    }
}
