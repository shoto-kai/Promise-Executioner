@testable import Entity
import XCTest
import Testing

public final class PushConditionDeadlineRestrictionTests: XCTestCase {
    
    func test期限で比較可能() {
        var restriction1 = PushCondition.DeadlineRestriction()
        restriction1.deadline = .init(at: 1)
        
        var restriction2 = PushCondition.DeadlineRestriction()
        restriction2.deadline = .init(at: 2)
        
        XCTAssertLessThan(restriction1, restriction2)
    }
}
