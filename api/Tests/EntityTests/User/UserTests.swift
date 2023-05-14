@testable import Entity
import Testing
import XCTest

public final class UserTests: XCTestCase {
    func test比較すると名前で比較される() {
        var alice = User()
        alice.name = .init("alice")!
        var bob = User()
        bob.name = .init("bob")!
        XCTAssertLessThan(alice, bob)
    }
}
