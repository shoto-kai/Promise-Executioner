import Entity
import Testing
import Usecase
import XCTest

@testable import Persistence

final class PushTaskDeadlineRestrictionTests: XCTestCase {

    func testモデルへの変換() {
        var restriction = Entity.PushTask.DeadlineRestriction()
        restriction.at = .init(at: 5)
        let taskID = UUID()

        let actual = restriction.toModel(of: taskID)

        XCTAssertEqual(actual.deadline, .init(at: 5))
    }

    func testモデルからエンティティへの変換() throws {
        let model = Persistence.PushTask.DeadlineRestriction(
            pushTaskID: UUID(),
            deadline: .init(at: 4)
        )

        let actual = model.toEntity

        let expected = Entity.PushTask.DeadlineRestriction(.init(at: 4))
        XCTAssertEqual(actual, expected)
    }
}
