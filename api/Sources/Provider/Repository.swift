import Fluent
import Persistence
import Repository
import Vapor

extension Request {

    var userFinder: some UserFindable {
        UserRepository(on: db)
    }

    var userFinderByUsername: some UserFindableByName {
        UserRepository(on: db)
    }

    var userFinderByBearerToken: some UserFindableByBearerToken {
        BearerAuthRepository(on: db)
    }

    var bearerUserSaver: some BearerUserSavible {
        BearerAuthRepository(on: db)
    }

    var oldBearerAuthDeleter: some OldBearerAuthDeletable {
        BearerAuthRepository(on: db)
    }

    var firebaseUserFinder: some FirebaseUserFindable {
        FirebaseUserRepository(on: db)
    }

    var firebaseUserCreator: some FirebaseUserCreatable {
        FirebaseUserRepository(on: db)
    }

    var firebaseUserDeleterByUserID: some FirebaseUserDeletableByUserID {
        FirebaseUserRepository(on: db)
    }

    var allTaskTaker: some AllTaskTakeable {
        AppTaskRepository(on: db)
    }

    var allUserTaskTaker: some AllUserTaskTakeable {
        AppTaskRepository(on: db)
    }

    var taskFinder: some TaskFindable {
        AppTaskRepository(on: db)
    }

    var taskCreator: some TaskCreatable {
        AppTaskRepository(on: db)
    }

    var taskUpdator: some TaskUpdatable {
        AppTaskRepository(on: db)
    }

    var taskDeleter: some TaskDeletable {
        AppTaskRepository(on: db)
    }
}
