@testable import Persistence
import Fluent
import XCTVapor
import App
import Entity

final class NotificationUpdatableTests: XCTestCase {
    
    func testUpdate() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)
        try await seed(on: app.db)
        
        let repository = AppNotificationRepository(on: app.db)
        
        let notifications = AppNotification.Seeder.entities
        
        let update = Entity.AppNotification(
            id: notifications[0].id,
            kind: .penalty,
            title: "ペナルティ",
            noticedAt: Date(timeIntervalSince1970: 10 * 24 * 60 * 60)
        )
        let userID = User.Seeder.entities[0].id
        try await repository.update(update, of: userID)
        
        var expected = notifications
        expected[0] = update
        expected.sort()
        
        let actual = try await repository.takeAll(of: userID).sorted()
        
        XCTAssertEqual(actual, expected)
    }
}
