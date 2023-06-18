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

    public var firebaseUserFinder: some FirebaseUserFindable {
        FirebaseUserRepository(on: db)
    }

    public var firebaseUserCreator: some FirebaseUserCreatable {
        FirebaseUserRepository(on: db)
    }

    public var firebaseUserDeleterByUserID: some FirebaseUserDeletableByUserID {
        FirebaseUserRepository(on: db)
    }
}
