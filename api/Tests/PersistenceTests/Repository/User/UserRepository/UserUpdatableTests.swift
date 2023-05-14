//@testable import Persistence
//import Fluent
//import XCTVapor
//import App
//import Entity
//
//final class UserUpdatableTests: XCTestCase {
//    
//    func testUpdate() async throws {
//        let app = Application(.testing)
//        defer { app.shutdown() }
//        try await configure(app)
//        try await seed(on: app.db)
//        
//        let repository = UserRepository(on: app.db)
//        
//        var aqua = User.Seeder.entities[0]
//        aqua.name = "Aqua"
//        
//        try await repository.update(aqua)
//        
//        var expected = User.Seeder.entities
//        expected[0] = aqua
//        
//        let actual = try await repository.takeAll().sorted()
//        
//        XCTAssertEqual(actual, expected)
//        
//        let expectedFriends = Dictionary(
//            grouping: Friend.Seeder.entities,
//            by: { $0.owner }
//        )[Friend.Seeder.entities[0].owner]!
//            .map { $0.friend }
//        
//        let actualFriends = try await FriendRepository(on: app.db)
//            .takeAll(of: Friend.Seeder.entities[0].owner.id)
//            .sorted()
//        
//        XCTAssertEqual(actualFriends, expectedFriends)
//    }
//}
