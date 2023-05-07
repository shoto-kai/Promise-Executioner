import Fluent
import Entity
import Repository

extension UserRepository: UserFindable {
    public func find(_ id: Entity.User.ID) async throws -> Entity.User? {
        try await User.find(id.value, on: db)
            .map { try $0.toEntity }
    }
}
