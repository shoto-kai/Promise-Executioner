import Vapor
import Fluent
import Repository
import Persistence

public extension Request {
    
    var userFinder: some UserFindable {
        UserRepository(on: db)
    }
    
    var userFinderByBearerToken: some UserFindableByBearerToken {
        BearerAuthRepository(on: db)
    }
    
    var bearerUserSaver: some BearerUserSavible {
        BearerAuthRepository(on: db)
    }
}
