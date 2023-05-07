import Foundation
import Fluent
import Entity

final class AppNotification: Model {
    
    static let schema = "notifications"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "user_id")
    var user: User
    
    @Enum(key: "kind")
    var kind: Entity.AppNotification.Kind
    
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
    
    init() { }
    
    init(
        id: UUID? = nil,
        userID: User.IDValue,
        kind: Entity.AppNotification.Kind,
        title: String,
        noticedAt: Date,
        readAt: Date? = nil
    ) {
        self.id = id
        self.$user.id = userID
        self.kind = kind
        self.title = title
        self.noticedAt = noticedAt
        self.readAt = readAt
    }
}

extension AppNotification {
    convenience init(_ entity: Entity.AppNotification, of userID: Entity.User.ID) {
        self.init(
            id: entity.id.value,
            userID: userID.value,
            kind: entity.kind,
            title: entity.title,
            noticedAt: entity.noticedAt,
            readAt: entity.readAt
        )
    }
}

extension AppNotification {
    var toEntity: Entity.AppNotification {
        get throws {
            try .init(
                id: .init(requireID()),
                kind: kind,
                title: title,
                noticedAt: noticedAt,
                readAt: readAt
            )
        }
    }
}
