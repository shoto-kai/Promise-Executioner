import App
import Entity
import Fluent
import XCTVapor

@testable import Persistence

final class UserCreatableTests: XCTestCase {

    func testCreate() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)
        try await seed(on: app.db)

        let repository = UserRepository(on: app.db)

        let newUser = try Entity.User(
            id: .init(), name: .init("shine"), displayName: "Shine")

        try await repository.create(newUser)

        let expected = User.Seeder.entities + [newUser]
        let actual = try await repository.takeAll().sorted()

        XCTAssertEqual(actual, expected)
    }
}
