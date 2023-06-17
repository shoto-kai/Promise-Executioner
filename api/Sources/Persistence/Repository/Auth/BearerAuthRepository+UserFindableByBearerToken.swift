import Entity
import Fluent
import Repository
import Usecase

extension BearerAuthRepository: UserFindableByBearerToken {
    public func find(_ token: Usecase.BearerAuth.Token) async throws -> Entity.User? {
        try await BearerAuth.query(on: db)
            .filter(\.$token == token.value)
            .first()?
            .user
            .toEntity
    }
}
