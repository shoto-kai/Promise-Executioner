@testable import Persistence
import XCTest
import Entity

final class PushConditionTests: XCTestCase {
    
    func testモデルとエンティティ間の変換() throws {
        let taskID = Entity.AppTask.ID(.init())
        let expected = Entity.PushCondition(
            id: .init(.init()),
            restrictions: [.deadline(at: .init(at: 4))],
            state: .completed(at: .init(at: 3))
        )
        let model = expected.toModel(of: taskID)
        model.$deadlineRestrictions.value = expected
            .restrictions.compactMap {
                $0.toDeadlineModel(of: expected.id)
            }
        let actual = try model.toEntity
        XCTAssertEqual(actual, expected)
    }
}
