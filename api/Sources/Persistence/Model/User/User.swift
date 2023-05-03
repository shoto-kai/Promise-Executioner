import Foundation
import Fluent
import Entity

final class User: Model {
    
    static let schema = "users"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
    
    init() { }
    
    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
    }
    
    @Siblings(through: Friend.self, from: \.$user, to: \.$friend)
    var friends: [User]
    
    @Children(for: \.$user)
    var notifications: [AppNotification]
    
    @Children(for: \.$user)
    var tasks: [AppTask]
    
    @Children(for: \.$destinationUser)
    var sendUserPenalties: [SendUserPenalty]
}

extension User {
    convenience init(_ entity: Entity.User) {
        self.init(
            id: entity.id.value,
            name: entity.name
        )
    }
}

extension User {
    var toEntity: Entity.User {
        get throws {
            try .init(id: .init(requireID()), name: name)
        }
    }
}
