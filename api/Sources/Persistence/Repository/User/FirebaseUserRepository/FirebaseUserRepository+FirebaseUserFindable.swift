import Fluent
import Usecase
import Repository

extension FirebaseUserRepository: FirebaseUserFindable {
    
    public func find(uid: String) async throws -> Firebase.User? {
        try await FirebaseUser.query(on: db)
            .filter(\.$uid == uid)
            .with(\.$user)
            .first()?
            .toEntity
    }
    
}
