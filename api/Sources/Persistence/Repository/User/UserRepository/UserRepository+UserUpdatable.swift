//import Entity
//import Repository
//
//extension UserRepository: UserUpdatable {
//    public func update(_ user: Entity.User) async throws {
//        guard let old = try await User.find(user.id.value, on: db) else {
//            throw DBError.notFound
//        }
//        let new = User(user)
//        new.createdAt = old.createdAt
//        new._$idExists = true
//        try await new.update(on: db)
//    }
//}
