@testable import Entity
import XCTest

final class UserTests: XCTestCase {
    
    static let values: [User] = [
        .init(id: .init(UUID()), name: "Alice"),
        .init(id: .init(UUID()), name: "Bell"),
        .init(id: .init(UUID()), name: "Cancy"),
    ]
    
    func test比較すると名前で比較される() {
        XCTAssertLessThan(Self.values[0], Self.values[1])
    }
}
