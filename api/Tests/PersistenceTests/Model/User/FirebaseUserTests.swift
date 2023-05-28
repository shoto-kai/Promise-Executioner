@testable import Persistence
import XCTest
import Entity
import Usecase
import Testing

final class FirebaseUserTests: XCTestCase {
    
    func testモデルとエンティティ間の変換() throws {
        let user = Entity.User()
        let expected = Firebase.User(
            user: user,
            emailVerified: true,
            email: "test@example.com",
            firebase: .init(
                signInProvider: "google",
                signInSecondFactor: "apple",
                secondFactorIdentifier: "github",
                tenant: "tenant"
            ),
            iss: "iss",
            phoneNumber: "090-1234-5678",
            picture: "hello.img",
            sub: "sub",
            uid: "uid"
        )
        let model: Persistence.FirebaseUser = expected.toModel
        model.$user.value = user.toModel
        let actual = try model.toEntity
        XCTAssertEqual(actual, expected)
    }
}
