@testable import Persistence
import Fluent
import XCTVapor
import App
import Entity

final class AllNotificationTakeableTests: XCTestCase {
    
    func testTakeAll() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)
        try await seed(on: app.db)
        
        let repository = AppNotificationRepository(on: app.db)
        
        let expected = AppNotification.Seeder.entities.sorted()
        
        let userID = User.Seeder.entities[0].id
        let actual = try await repository.takeAll(of: userID).sorted()
        
        XCTAssertEqual(actual, expected)
    }
}
