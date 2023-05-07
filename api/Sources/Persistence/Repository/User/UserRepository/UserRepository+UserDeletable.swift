import Fluent
import Entity
import Repository

extension UserRepository: UserDeletable {
    public func delete(_ id: Entity.User.ID) async throws {
        try await db.transaction { transaction in
            guard let user = try await User.find(id.value, on: transaction) else {
                throw DBError.notFound
            }
            try await Friend.query(on: transaction)
                .group(.or) { $0
                    .filter(\.$user.$id == id.value)
                    .filter(\.$friend.$id == id.value)
                }
                .delete()
            try await user.delete(on: transaction)
        }
    }
}
