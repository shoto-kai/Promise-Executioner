import Testing
import XCTest

@testable import Entity

final class AppPromiseTaskTest: XCTestCase {

    func test押下制約のdealineがnilならばisExpiredは常にfalse() {
        let push = AppPromise.Task.push(deadline: nil)
        XCTAssertFalse(push.isExpired(now: Date.now))
    }

    func test押下制約のdealineが現在よりも前ならばisExpiredはtrue() {
        var deadline: PushTask.DeadlineRestriction = .init()
        deadline.at = .init(at: 3)
        let push = AppPromise.Task.push(deadline: deadline)
        XCTAssertTrue(push.isExpired(now: .init(at: 5)))
    }

    func test押下制約のdealineが現在と同じならばisExpiredはfalse() {
        var deadline: PushTask.DeadlineRestriction = .init()
        deadline.at = .init(at: 3)
        let push = AppPromise.Task.push(deadline: deadline)
        XCTAssertFalse(push.isExpired(now: .init(at: 3)))
    }

    func test押下制約のdealineが現在よりも後ならばisExpiredはfalse() {
        var deadline: PushTask.DeadlineRestriction = .init()
        deadline.at = .init(at: 4)
        let push = AppPromise.Task.push(deadline: deadline)
        XCTAssertFalse(push.isExpired(now: .init(at: 3)))
    }
}
