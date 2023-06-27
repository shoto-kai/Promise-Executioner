import Testing
import XCTest

@testable import Entity

final class UserNameTests: XCTestCase {

    func test半角小文字英数字ハイフンで初期化可能() throws {
        _ = try User.Name("alice-hello-34-world")
    }

    func test大文字で初期化できない() {
        XCTAssertThrowsError(try User.Name("Alice")) { err in
            XCTAssertEqual(
                err as? ApiError,
                .validation(reason: "Aliceにハイフン小文字数字以外が含まれています。")
            )
        }
    }

    func test日本語で初期化できない() {
        XCTAssertThrowsError(try User.Name("Alice"))
    }

    func test全角数字で初期化できない() {
        XCTAssertThrowsError(try User.Name("alice３"))
    }

    func test辞書順で比較できる() throws {
        let alice = try User.Name("alice")
        let bob = try User.Name("bob")
        XCTAssertLessThan(alice, bob)
    }
}
