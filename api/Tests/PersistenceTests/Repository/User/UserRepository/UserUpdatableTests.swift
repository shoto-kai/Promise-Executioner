@testable import Persistence
import Fluent
import XCTVapor
import App
import Entity

final class UserUpdatableTests: XCTestCase {
    
    func testUpdate() async throws {
        let app = Application(.testing)
        defer { app.shutdown() }
        try await configure(app)
        try await seed(on: app.db)
        
        let repository = UserRepository(on: app.db)
        
        var aqua = User.Seeder.entities[0]
        aqua.name = try .init("aqua")
        aqua.displayName = "Aqua"
        
        try await repository.update(aqua)
        
        var expected = User.Seeder.entities
        expected[0] = aqua
        
        let actual = try await repository.takeAll().sorted()
        
        XCTAssertEqual(actual, expected)
    }
}
