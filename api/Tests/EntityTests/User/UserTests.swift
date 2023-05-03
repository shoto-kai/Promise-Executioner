@testable import Entity
import XCTest

final class UserTests: XCTestCase {
    
    func test初期化() {
        let id = User.ID(UUID())
        let user = User(id: id, name: "ユーザー名")
        XCTAssertEqual(user.id, id)
        XCTAssertEqual(user.name, "ユーザー名")
    }
}
