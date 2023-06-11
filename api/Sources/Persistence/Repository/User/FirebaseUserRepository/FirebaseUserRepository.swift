import Fluent

public struct FirebaseUserRepository {
    
    var db: Database
    
    public init(on db: Database) {
        self.db = db
    }
}

extension FirebaseUserRepository {
    var userRepository: UserRepository {
        .init(on: db)
    }
}
