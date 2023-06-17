import Entity
import Usecase

public protocol UserFindableByBearerToken {
    func find(_ token: BearerAuth.Token) async throws -> User?
}

public protocol BearerUserSavible {
    func save(userID: User.ID, token: BearerAuth.Token) async throws
}
