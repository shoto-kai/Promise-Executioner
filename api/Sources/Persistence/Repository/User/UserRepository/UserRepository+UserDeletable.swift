import Fluent
import Entity
import Repository

extension UserRepository: UserDeletable {
    public func delete(_ id: Entity.User.ID) async throws {
        try await db.transaction { transaction in
            try await firebaseUserRepository.delete(id, on: transaction)
            guard let user = try await User.find(id.value, on: transaction) else {
                throw DBError.notFound
            }
            try await user.delete(on: transaction)
        }
    }
}
