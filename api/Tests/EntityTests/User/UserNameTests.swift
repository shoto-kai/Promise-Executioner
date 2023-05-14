@testable import Entity
import Testing
import XCTest

public final class UserNameTests: XCTestCase {
    
    func test半角小文字英数字ハイフンで初期化可能() {
        XCTAssertNotNil(User.Name("alice-hello-34-world"))
    }
    
    func test大文字で初期化できない() {
        XCTAssertNil(User.Name("Alice"))
    }
    
    func test日本語で初期化できない() {
        XCTAssertNil(User.Name("おはよう"))
    }
    
    func test全角数字で初期化できない() {
        XCTAssertNil(User.Name("alice３"))
    }
    
    func test辞書順で比較できる() {
        XCTAssertLessThan(User.Name("alice")!, User.Name("bob")!)
    }
}
