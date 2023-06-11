import Fluent
import Entity
import Repository

extension UserRepository: UserCreatable {
    
    public func create(_ user: Entity.User) async throws {
        try await create(user, on: db)
    }
    
    func create(_ user: Entity.User, on db: Database) async throws {
        try await user.toModel.create(on: db)
    }
    
}
