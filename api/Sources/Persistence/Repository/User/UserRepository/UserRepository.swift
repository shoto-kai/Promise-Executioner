import Fluent

public struct UserRepository {

    public var db: Database

    public init(on db: Database) {
        self.db = db
    }

    var firebaseUserRepository: FirebaseUserRepository {
        .init(on: db)
    }

    var taskRepository: AppTaskRepository {
        .init(on: db)
    }
}
