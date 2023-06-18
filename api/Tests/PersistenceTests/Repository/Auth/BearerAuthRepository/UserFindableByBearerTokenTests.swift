import App
import Entity
import Repository
import Usecase
import XCTVapor

@testable import Persistence

final class UserFindableByBearerTokenTests: XCTestCase {

    func testFind() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)
        try await seed(on: app.db)

        let repository = BearerAuthRepository(on: app.db)

        let expected = Persistence.User.Seeder.entities[0]
        let actual = try await repository.find(.init("token1"))
        XCTAssertEqual(actual, expected)
    }

    func testNotFound() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)
        try await seed(on: app.db)

        let repository = BearerAuthRepository(on: app.db)

        let expected: Entity.User? = nil
        let actual = try await repository.find(.init("unknown-token"))
        XCTAssertEqual(actual, expected)
    }
}
