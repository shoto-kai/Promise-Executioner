@testable import Persistence
import XCTest
import Entity

final class DateLimitRestrictionTests: XCTestCase {
    
    func testエンティティをモデルに変換() {
        let uuid = UUID()
        let taskID = Entity.AppTask.ID(UUID())
        let entity = Entity.DateLimitRestriction(
            id: .init(uuid),
            limit: Date(timeIntervalSince1970: 3 * 24 * 60 * 60),
            completedAt: Date(timeIntervalSince1970: 2 * 24 * 60 * 60)
        )
        
        let model: Persistence.DateLimitRestriction = .init(entity, of: taskID)
        XCTAssertEqual(model.id, uuid)
        XCTAssertEqual(model.$task.id, taskID.value)
        XCTAssertEqual(model.limit, entity.limit)
        XCTAssertEqual(model.completedAt, entity.completedAt)
    }
    
    func testモデルをエンティティに変換() throws {
        let uuid = UUID()
        let model = Persistence.DateLimitRestriction(
            id: uuid,
            taskID: .init(),
            limit: Date(timeIntervalSince1970: 4 * 24 * 60 * 60),
            completedAt: Date(timeIntervalSince1970: 3 * 24 * 60 * 60)
        )
        
        let expected = Entity.DateLimitRestriction(
            id: .init(uuid),
            limit: Date(timeIntervalSince1970: 4 * 24 * 60 * 60),
            completedAt: Date(timeIntervalSince1970: 3 * 24 * 60 * 60)
        )
        let actual = try model.toEntity
        XCTAssertEqual(actual, expected)
    }
}
