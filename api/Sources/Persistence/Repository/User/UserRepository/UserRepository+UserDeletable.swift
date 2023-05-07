import Fluent
import Entity
import Repository

extension UserRepository: UserDeletable {
    public func delete(_ id: Entity.User.ID) async throws {
        guard let user = try await User.find(id.value, on: db) else {
            throw DBError.notFound
        }
        try await db.transaction { transaction in
            try await Friend.query(on: transaction)
                .group(.or) { $0
                    .filter(\.$user.$id == id.value)
                    .filter(\.$friend.$id == id.value)
                }
                .delete()
            try await AppNotification.query(on: transaction)
                .filter(\.$user.$id == id.value)
                .delete()
            try await user.delete(on: transaction)
        }
    }
}
