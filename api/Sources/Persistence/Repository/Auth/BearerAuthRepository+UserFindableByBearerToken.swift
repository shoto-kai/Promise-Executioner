import Fluent
import Entity
import Usecase
import Repository

extension BearerAuthRepository: UserFindableByBearerToken {
    public func find(_ token: Usecase.BearerAuth.Token) async throws -> Entity.User? {
        try await BearerAuth.query(on: db)
            .filter(\.$token == token.value)
            .first()?
            .user
            .toEntity
    }
}
