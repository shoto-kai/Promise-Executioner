import Foundation
import Fluent
import Entity

final class User: Model {
    
    static let schema = "users"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "display_name")
    var displayName: String
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
    
    init() { }
    
    init(id: UUID? = nil, name: String, displayName: String) {
        self.id = id
        self.name = name
        self.displayName = displayName
    }
}

extension Entity.User {
    var toModel: Persistence.User {
        .init(
            id: id.value,
            name: name.value,
            displayName: displayName
        )
    }
}

extension User {
    var toEntity: Entity.User {
        get throws {
            let name = try Entity.User.Name(name)
            return try .init(
                id: .init(requireID()),
                name: name,
                displayName: displayName
            )
        }
    }
}
