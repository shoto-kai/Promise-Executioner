import Entity
import Repository

extension UserRepository: AllUserTakeable {
    public func takeAll() async throws -> [Entity.User] {
        try await User.query(on: db).all().map { try $0.toEntity }
    }
}
