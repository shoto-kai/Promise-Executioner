import Entity
import XCTest

@testable import Persistence

final class ConditionStateHelperTests: XCTestCase {

    let completed: ConditionState = .completed(at: .init(at: 3))
    let failed: ConditionState = .failed(at: .init(at: 4))
    let incomplete: ConditionState = .incomplete

    func test_completedAtの取得() {
        XCTAssertEqual(completed.completedAt, .init(at: 3))
        XCTAssertNil(failed.completedAt)
        XCTAssertNil(incomplete.completedAt)
    }

    func test_failedAtの取得() {
        XCTAssertNil(completed.failedAt)
        XCTAssertEqual(failed.failedAt, .init(at: 4))
        XCTAssertNil(incomplete.failedAt)
    }

    func test初期化() {
        XCTAssertEqual(
            ConditionState(.init(at: 3), nil),
            completed
        )
        XCTAssertEqual(
            ConditionState(nil, .init(at: 4)),
            failed
        )
        XCTAssertEqual(ConditionState(nil, nil), incomplete)
    }
}
