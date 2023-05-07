import Foundation
import Fluent
import Entity

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
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
    
    init() { }
    
    init(id: UUID? = nil, userID: User.IDValue, title: String, note: String) {
        self.id = id
        self.$user.id = userID
        self.title = title
        self.note = note
    }
    
    @Children(for: \.$task)
    var dateLimitRestrictions: [DateLimitRestriction]
    
    @Children(for: \.$task)
    var sendUserPenalties: [SendUserPenalty]
}

extension AppTask {
    convenience init(_ entity: Entity.AppTask, of userID: Entity.User.ID) {
        self.init(
            id: entity.id.value,
            userID: userID.value,
            title: entity.title,
            note: entity.note
        )
    }
}

extension AppTask {
    
    /// with
    /// - dateLimitRestrictions
    /// - sendUserPenalties
    var toEntity: Entity.AppTask {
        get throws {
            try .init(
                id: .init(requireID()),
                title: title,
                note: note,
                restrictions: .init(
                    dateLimitRestrictions: dateLimitRestrictions.map { try $0.toEntity }
                ),
                penalties: .init(
                    sendUserPenalties: sendUserPenalties.map { try $0.toEntity }
                )
            )
        }
    }
}
