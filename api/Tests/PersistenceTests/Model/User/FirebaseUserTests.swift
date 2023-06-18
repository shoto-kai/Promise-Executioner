import Entity
import Testing
import Usecase
import XCTest

@testable import Persistence

final class FirebaseUserTests: XCTestCase {

    func testモデルとエンティティ間の変換() throws {
        let user = Entity.User()
        let expected = Firebase.User(
            user: user,
            emailVerified: true,
            email: "test@example.com",
            picture: "hello.img",
            uid: "uid",
            providerId: "google"
        )
        let model: Persistence.FirebaseUser = expected.toModel
        model.$user.value = user.toModel
        let actual = try model.toEntity
        XCTAssertEqual(actual, expected)
    }
}
