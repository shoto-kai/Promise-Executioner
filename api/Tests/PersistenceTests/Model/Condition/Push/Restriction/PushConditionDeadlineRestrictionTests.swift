@testable import Persistence
import XCTest
import Entity

final class PushConditionDeadlineRestrictionTests: XCTestCase {
    
    func testモデルとエンティティ間の変換() {
        let conditionID = Entity.PushCondition.ID(.init())
        let expected = Entity.PushCondition.Restriction.deadline(at: .init(at: 3))
        
        let actual = expected
            .toDeadlineModel(of: conditionID)?
            .toEntity
        XCTAssertEqual(actual, expected)
    }
}
