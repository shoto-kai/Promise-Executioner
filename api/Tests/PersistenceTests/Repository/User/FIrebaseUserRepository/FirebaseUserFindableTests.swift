import App
import Entity
import Fluent
import Repository
import Usecase
import XCTVapor

@testable import Persistence

final class FirebaseUserFindableTests: XCTestCase {

    func testFind() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)
        try await seed(on: app.db)

        let repository: FirebaseUserFindable = FirebaseUserRepository(on: app.db)

        let expected: Firebase.User = FirebaseUser.Seeder.entities[0]
        let actual = try await repository.find(uid: expected.uid)

        XCTAssertEqual(actual, expected)
    }
}
