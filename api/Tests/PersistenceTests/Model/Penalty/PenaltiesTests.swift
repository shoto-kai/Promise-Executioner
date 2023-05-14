@testable import Persistence
import XCTest
import Entity
import Testing

final class PenaltiesTests: XCTestCase {
    
    func testエンティティからモデルへの変換() throws {
        let taskID = Entity.AppTask.ID(.init())
        
        let user = Entity.User()
        var send1 = Entity.SendMessageToUserPenalty()
        send1.amount = 100
        send1.destine = user
        var send2 = Entity.SendMessageToUserPenalty()
        send2.amount = 200
        send2.destine = user
        var send3 = Entity.SendMessageToUserPenalty()
        send3.amount = 300
        send3.destine = user
        
        let expected = Entity.Penalties(
            sendMessageToUser: [send1, send2, send3]
        )
        let models: [Persistence.SendMessageToUserPenalty] = expected.toModel(of: taskID)
        models.forEach { model in
            model.$destineUser.value = user.toModel
        }
        let actual = try models.map { try $0.toEntity }
        XCTAssertEqual(actual, [send1, send2, send3])
    }
}
