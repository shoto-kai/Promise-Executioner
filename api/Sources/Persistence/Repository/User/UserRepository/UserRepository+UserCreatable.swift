import Entity
import Repository

extension UserRepository: UserCreatable {
    public func create(_ user: Entity.User) async throws {
        try await User(user).create(on: db)
    }
}
