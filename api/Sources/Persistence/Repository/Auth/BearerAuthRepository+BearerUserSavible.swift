import Entity
import Fluent
import Repository
import Usecase

extension BearerAuthRepository: BearerUserSavible {

    public func save(
        userID: Entity.User.ID,
        token: Usecase.BearerAuth.Token
    ) async throws {
        if let auth = try await findAuth(userID, on: db) {
            try await update(auth: auth, userID: userID, token: token, on: db)
        } else {
            try await create(userID: userID, token: token, on: db)
        }
    }

    private func findAuth(_ userID: Entity.User.ID, on db: Database) async throws -> BearerAuth? {
        try await BearerAuth.query(on: db)
            .filter(\.$user.$id == userID.value)
            .first()
    }

    private func create(
        userID: Entity.User.ID,
        token: Usecase.BearerAuth.Token,
        on db: Database
    ) async throws {
        try await BearerAuth(userID: userID.value, token: token.value).create(on: db)
    }

    private func update(
        auth: BearerAuth,
        userID: Entity.User.ID,
        token: Usecase.BearerAuth.Token,
        on db: Database
    ) async throws {
        auth.$user.id = userID.value
        auth.token = token.value
        try await auth.update(on: db)
    }
}
