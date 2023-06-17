import Fluent
import Repository
import Usecase

extension FirebaseUserRepository: FirebaseUserCreatable {

    public func create(_ firebaseUser: Usecase.Firebase.User) async throws {
        try await db.transaction { transaction in
            try await userRepository.create(firebaseUser.user, on: transaction)
            try await firebaseUser.toModel.create(on: transaction)
        }
    }

}
