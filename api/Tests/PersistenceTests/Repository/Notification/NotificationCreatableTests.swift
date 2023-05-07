@testable import Persistence
import Fluent
import XCTVapor
import App
import Entity

final class NotificationCreatableTests: XCTestCase {
    
    func testCreate() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)
        try await seed(on: app.db)
        
        let repository = AppNotificationRepository(on: app.db)
        
        let new = Entity.AppNotification(
            id: .init(.init()),
            kind: .sign,
            title: "制約",
            noticedAt: Date(timeIntervalSince1970: 5 * 24 * 60 * 60)
        )
        let userID = User.Seeder.entities[0].id
        
        try await repository.create(new, of: userID)
        
        let expected = AppNotification.Seeder.entities + [new]
        let actual = try await repository.takeAll(of: userID)
        
        XCTAssertEqual(actual, expected)
    }
}
