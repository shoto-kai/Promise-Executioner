import Entity
import XCTest

@testable import Persistence

final class AppTaskStateHelperTests: XCTestCase {

    typealias State = Entity.AppTask.State

    let completed: State = .completed(at: .init(at: 3))
    let failed: State = .failed(at: .init(at: 4))
    let incomplete: State = .incomplete

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
            State(.init(at: 3), nil),
            completed
        )
        XCTAssertEqual(
            State(nil, .init(at: 4)),
            failed
        )
        XCTAssertEqual(State(nil, nil), incomplete)
    }
}
