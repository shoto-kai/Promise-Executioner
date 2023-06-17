import App
import Entity
import Fluent
import XCTVapor

@testable import Persistence

final class AllUserTakeableTests: XCTestCase {

    func testTakeAll() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)
        try await seed(on: app.db)

        let repository = UserRepository(on: app.db)

        let expected = User.Seeder.entities
        let actual = try await repository.takeAll().sorted()

        XCTAssertEqual(actual, expected)
    }
}
