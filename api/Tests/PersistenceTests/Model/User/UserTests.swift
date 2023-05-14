@testable import Persistence
import XCTest
import Entity

final class UserTests: XCTestCase {
    
    func testモデルとエンティティ間の変換() throws {
        let expected = Entity.User(
            id: .init(.init()),
            name: .init("alice")!,
            displayName: "Alice"
        )
        let actual = try expected.toModel.toEntity
        XCTAssertEqual(actual, expected)
    }
}
