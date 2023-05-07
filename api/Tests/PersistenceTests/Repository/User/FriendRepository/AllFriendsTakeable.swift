@testable import Persistence
import Fluent
import XCTVapor
import App
import Entity

final class AllFriendsTakeableTests: XCTestCase {
    
    func testTakeAll() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)
        try await seed(on: app.db)
        
        let repository = FriendRepository(on: app.db)
        
        let expected = Dictionary(
            grouping: Friend.Seeder.entities,
            by: { $0.owner }
        )[Friend.Seeder.entities[0].owner]!
            .map { $0.friend }
        
        let actual = try await repository
            .takeAll(of: Friend.Seeder.entities[0].owner.id)
            .sorted()
        
        XCTAssertEqual(actual, expected)
    }
}
