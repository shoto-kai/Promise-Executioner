import Fluent
import Entity
import Repository

extension UserRepository: UserDeletable {
    public func delete(_ id: Entity.User.ID) async throws {
        guard let user = try await User.find(id.value, on: db) else {
            throw DBError.notFound
        }
        try await user.delete(on: db)
    }
}
