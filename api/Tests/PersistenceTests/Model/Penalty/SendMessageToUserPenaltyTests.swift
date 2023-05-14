@testable import Persistence
import XCTest
import Entity
import Testing

final class SendMessageToUserPenaltyTests: XCTestCase {
    
    func testモデルとエンティティ間の変換() throws {
        let taskID = Entity.AppTask.ID(.init())
        let expected = Entity.SendMessageToUserPenalty(
            id: .init(.init()),
            destine: .init(),
            amount: 10,
            note: "hello",
            message: "world",
            executedAt: .init(at: 10)
        )
        let model = expected.toModel(of: taskID)
        model.$destineUser.value = expected.destine.toModel
        let actual = try model.toEntity
        XCTAssertEqual(actual, expected)
    }
}
