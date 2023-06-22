import Entity
import Vapor

public struct User: Hashable, Content {

    public var id: UUID
    
    public var name: String
    
    public var displayName: String

    init(id: UUID, name: String, displayName: String) {
        self.id = id
        self.name = name
        self.displayName = displayName
    }
}

extension User {
    public var toEntity: Entity.User {
        get throws {
            try .init(
                id: .init(id),
                name: .init(name),
                displayName: displayName
            )
        }
    }
}

extension Entity.User {
    public var toContent: User {
        .init(id: id.value, name: name.value, displayName: displayName)
    }
}
