//@testable import Persistence
//import Fluent
//import XCTVapor
//import App
//import Entity
//
//final class UserFindableTests: XCTestCase {
//    
//    func testFind() async throws {
//        let app = Application(.testing)
//        defer { app.shutdown() }
//        try await configure(app)
//        try await seed(on: app.db)
//        
//        let repository = UserRepository(on: app.db)
//        
//        let expected: Entity.User = User.Seeder.entities[0]
//        let actual = try await repository.find(expected.id)
//        
//        XCTAssertEqual(actual, expected)
//    }
//}
