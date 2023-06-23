import Testing
import XCTest

@testable import Entity

public final class UserTests: XCTestCase {
    func test比較すると名前で比較される() throws {
        var alice = User()
        alice.name = try .init("alice")
        var bob = User()
        bob.name = try .init("bob")
        XCTAssertLessThan(alice, bob)
    }
}
