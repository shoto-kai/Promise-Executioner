import Entity
import Fluent
import Repository

extension UserRepository: UserFindableByName {
    public func find(_ username: Entity.User.Name) async throws -> Entity.User? {
        try await User.query(on: db)
            .filter(\.$name == username.value)
            .first()
            .map { try $0.toEntity }
    }
}
