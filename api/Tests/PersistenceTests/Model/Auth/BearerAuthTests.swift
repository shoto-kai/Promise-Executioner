import Entity
import Testing
import Usecase
import XCTest

@testable import Persistence

final class BearerAuthTests: XCTestCase {

    func testモデルへの変換() {
        var auth = Usecase.BearerAuth()
        auth.user.id = .init("E1D9CA1C-F03A-4FFA-99AE-4A4EB15216B4")
        auth.token = .init("48BEEB9C-A183-4F5F-91F8-9D8CFF6A9728")

        let actual = auth.toModel

        XCTAssertEqual(actual.$user.id, UUID("E1D9CA1C-F03A-4FFA-99AE-4A4EB15216B4"))
        XCTAssertEqual(actual.token, .init("48BEEB9C-A183-4F5F-91F8-9D8CFF6A9728"))
    }

    func testモデルからユースケースへの変換() throws {
        let user = Entity.User()
        let model = Persistence.BearerAuth(
            userID: user.id.value,
            token: "2EDE6E0C-BFC7-4FC1-B122-937AA74A96F6"
        )
        model.$user.value = user.toModel

        let actual = try model.toEntity

        let expected = Usecase.BearerAuth(
            user: user,
            token: .init("2EDE6E0C-BFC7-4FC1-B122-937AA74A96F6")
        )
        XCTAssertEqual(actual, expected)
    }
}
