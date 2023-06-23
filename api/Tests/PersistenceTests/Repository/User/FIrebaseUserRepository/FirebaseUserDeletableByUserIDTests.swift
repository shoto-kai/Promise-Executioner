import App
import Entity
import Fluent
import Repository
import Usecase
import XCTVapor

@testable import Persistence

final class FirebaseUserDeletableByUserIDTests: XCTestCase {

    func testDeleteByUserID() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)
        try await seed(on: app.db)

        let deletable: any FirebaseUserDeletableByUserID = FirebaseUserRepository(on: app.db)
        let repository = FirebaseUserRepository(on: app.db)

        let targetFirebaseUser = FirebaseUser.Seeder.entities[0]

        try await deletable.delete(targetFirebaseUser.user.id)

        let found = try await repository.find(uid: targetFirebaseUser.uid)
        XCTAssertNil(found)
    }
}
