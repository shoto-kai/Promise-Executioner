@testable import Persistence
import Fluent
import XCTVapor
import App
import Entity

final class FriendDeletableTests: XCTestCase {
    
    func testDelete() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)
        try await seed(on: app.db)
        
        let repository = FriendRepository(on: app.db)
        try await repository.delete(
            friend: User.Seeder.entities[2].id,
            of: User.Seeder.entities[0].id
        )
        
        let expected = [User.Seeder.entities[1]]
        
        let actual = try await repository
            .takeAll(of: User.Seeder.entities[0].id)
            .sorted()
        
        XCTAssertEqual(actual, expected)
    }
}
