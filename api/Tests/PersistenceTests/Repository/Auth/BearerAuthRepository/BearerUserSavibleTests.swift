import App
import Entity
import Repository
import Usecase
import XCTVapor

@testable import Persistence

final class BearerUserSavibleTests: XCTestCase {

    func testCreate() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)
        try await seed(on: app.db)
        
        let repository = BearerAuthRepository(on: app.db)
        
        try await repository.save(
            userID: Persistence.User.Seeder.entities[3].id,
            token: .init("token3")
        )

        let expected = Persistence.User.Seeder.entities[3]
        let actual = try await repository.find(.init("token3"))
        XCTAssertEqual(actual, expected)
    }
    
    func testUpdate() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)
        try await seed(on: app.db)
        
        let repository = BearerAuthRepository(on: app.db)
        
        try await repository.save(
            userID: Persistence.User.Seeder.entities[0].id,
            token: .init("token3")
        )

        let expected = Persistence.User.Seeder.entities[0]
        let actual = try await repository.find(.init("token3"))
        XCTAssertEqual(actual, expected)
    }
}
