import XCTest

@testable import Entity

final class RestrictionTest: XCTestCase {
    
    func test押下制約のdealineがnilならばisExpiredは常にfalse() {
        let push = Restriction.push(deadline: nil)
        XCTAssertFalse(push.isExpired(now: Date.now))
    }
    
    func test押下制約のdealineが現在よりも前ならばisExpiredはtrue() {
        let push = Restriction.push(deadline: .init(at: 3))
        XCTAssertTrue(push.isExpired(now: .init(at: 5)))
    }
    
    func test押下制約のdealineが現在と同じならばisExpiredはfalse() {
        let push = Restriction.push(deadline: .init(at: 3))
        XCTAssertFalse(push.isExpired(now: .init(at: 3)))
    }
    
    func test押下制約のdealineが現在よりも後ならばisExpiredはfalse() {
        let push = Restriction.push(deadline: .init(at: 4))
        XCTAssertFalse(push.isExpired(now: .init(at: 3)))
    }
}
