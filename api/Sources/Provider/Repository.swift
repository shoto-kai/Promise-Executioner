import Fluent
import Persistence
import Repository
import Vapor

extension Request {

    public var userFinder: some UserFindable {
        UserRepository(on: db)
    }

    public var userFinderByBearerToken: some UserFindableByBearerToken {
        BearerAuthRepository(on: db)
    }

    public var bearerUserSaver: some BearerUserSavible {
        BearerAuthRepository(on: db)
    }
}
