import Fluent
import Entity
import Repository

extension UserRepository: UserDeletable {
    public func delete(_ userID: Entity.User.ID) async throws {
        try await User.query(on: db)
            .filter(\.$id == userID.value)
            .delete()
    }
}
