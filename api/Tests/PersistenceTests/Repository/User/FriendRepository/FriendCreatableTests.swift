@testable import Persistence
import Fluent
import XCTVapor
import App
import Entity

final class FriendCreatableTests: XCTestCase {
    
    func testCreate() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)
        try await seed(on: app.db)
        
        let repository = FriendRepository(on: app.db)
        
        try await repository.register(
            friend: User.Seeder.entities[2].id,
            of: User.Seeder.entities[1].id
        )
        
        let expected = Dictionary(
            grouping: Friend.Seeder.entities,
            by: { $0.owner }
        )[User.Seeder.entities[1]]!
            .map { $0.friend } + [User.Seeder.entities[2]].sorted()
        
        let actual = try await repository
            .takeAll(of: User.Seeder.entities[1].id)
            .sorted()
        
        XCTAssertEqual(actual, expected)
    }
}
