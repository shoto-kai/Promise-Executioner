@testable import Persistence
import XCTest
import Entity

final class AppTaskTests: XCTestCase {
    
    func testエンティティとモデルの変換() throws {
        let expected = Entity.AppTask(
            id: .init(.init()),
            title: "Title",
            note: "Note",
            state: .completed(at: .init(at: 10)),
            conditions: .init(),
            penalties: .init()
        )
        
        let model = expected.toModel(of: .init(.init()))
        model.$pushConditions.value = []
        model.$sendMessageToUserPenalties.value = []
        
        let actual = try model.toEntity
        XCTAssertEqual(actual, expected)
    }
}
