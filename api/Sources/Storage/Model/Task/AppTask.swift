import Foundation
import Fluent

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
}

