import Entity
import Fluent
import Repository
import Usecase

extension FirebaseUserRepository: FirebaseUserDeletableByUserID {

    public func delete(_ userID: Entity.User.ID) async throws {
        try await delete(userID, on: db)
    }

    func delete(_ userID: Entity.User.ID, on db: Database) async throws {
        try await FirebaseUser.query(on: db)
            .filter(\.$user.$id == userID.value)
            .delete()
    }

}
