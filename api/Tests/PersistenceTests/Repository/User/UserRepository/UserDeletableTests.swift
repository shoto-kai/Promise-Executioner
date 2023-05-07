@testable import Persistence
import Fluent
import XCTVapor
import App
import Entity

final class UserDeletableTests: XCTestCase {
    
    func testDelete() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)
        try await seed(on: app.db)
        
        let repository = UserRepository(on: app.db)
        
        try await repository.delete(User.Seeder.entities[0].id)
        
        let expected = Array(User.Seeder.entities[1...])
        let actual = try await repository.takeAll().sorted()
        
        XCTAssertEqual(actual, expected)
    }
}
