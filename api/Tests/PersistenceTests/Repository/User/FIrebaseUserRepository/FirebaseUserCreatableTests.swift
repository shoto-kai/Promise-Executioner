import App
import Entity
import Repository
import Usecase
import XCTVapor

@testable import Persistence

final class FirebaseUserCreatableTests: XCTestCase {

    func testCreate() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)
        try await seed(on: app.db)

        let creatable: FirebaseUserCreatable = FirebaseUserRepository(on: app.db)
        let repository = FirebaseUserRepository(on: app.db)

        let expected: Firebase.User = try .init(
            user: .init(id: .init(UUID()), name: .init("test"), displayName: "Test"),
            emailVerified: true,
            email: "test@example.com",
            picture: "https://example.com/picture/test",
            uid: "test_uid",
            providerId: nil
        )

        try await creatable.create(expected)

        let actual = try await repository.find(uid: expected.uid)
        XCTAssertEqual(actual, expected)
    }
}
