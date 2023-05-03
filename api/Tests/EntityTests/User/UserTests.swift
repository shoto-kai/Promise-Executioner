@testable import Entity
import Testing
import XCTest

public final class UserTests: XCTestCase {
    func test比較すると名前で比較される() {
        XCTAssertLessThan(
            User(id: .init(UUID()), name: "Alice"),
            User(id: .init(UUID()), name: "Bob")
        )
    }
}
