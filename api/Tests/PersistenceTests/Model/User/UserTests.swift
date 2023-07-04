import Entity
import XCTest

@testable import Persistence

final class UserTests: XCTestCase {

    func testモデルとエンティティ間の変換() throws {
        let expected = try Entity.User(
            id: .init(),
            name: .init("alice"),
            displayName: "Alice"
        )
        let actual = try expected.toModel.toEntity
        XCTAssertEqual(actual, expected)
    }
}
