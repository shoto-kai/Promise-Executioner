//import App
//import Entity
//import Fluent
//import XCTVapor
//
//@testable import Persistence
//
//final class UserDeletableTests: XCTestCase {
//
//    func testDelete() async throws {
//        let app = Application(.testing)
//        defer { app.shutdown() }
//        try await configure(app)
//        try await seed(on: app.db)
//
//        let repository = UserRepository(on: app.db)
//
//        try await repository.delete(User.Seeder.entities[0].id)
//
//        let expected = Array(User.Seeder.entities[1...])
//        let actual = try await repository.takeAll().sorted()
//
//        XCTAssertEqual(actual, expected)
//    }
//
//    func test存在しないレコードを削除しようとした場合Errorが投げられる() async throws {
//        let app = Application(.testing)
//        defer { app.shutdown() }
//        try await configure(app)
//        try await seed(on: app.db)
//
//        let repository = UserRepository(on: app.db)
//
//        do {
//            try await repository.delete(.init(.init()))
//            XCTFail("エラーが投げられなかった")
//        } catch DBError.notFound {
//            let expected = User.Seeder.entities
//            let actual = try await repository.takeAll().sorted()
//
//            XCTAssertEqual(actual, expected)
//        } catch {
//            XCTFail("DBError.notFound以外が投げられた")
//        }
//    }
//}
