@testable import Persistence
import XCTest
import Entity

final class SendUserPenaltyTests: XCTestCase {
    
    func testエンティティをモデルに変換() {
        let uuid = UUID()
        let taskID = Entity.AppTask.ID(UUID())
        let user = Entity.User(id: .init(UUID()), name: "田中")
        let entity = Entity.SendUserPenalty(
            id: .init(uuid),
            destination: user,
            overview: "PayPay",
            note: "500円分",
            content: "https://example.com",
            executedAt: Date(timeIntervalSince1970: 24 * 60 * 60)
        )
        
        let model: Persistence.SendUserPenalty = .init(entity, of: taskID)
        XCTAssertEqual(model.id, uuid)
        XCTAssertEqual(model.$task.id, taskID.value)
        XCTAssertEqual(model.$destinationUser.id, user.id.value)
        XCTAssertEqual(model.overview, "PayPay")
        XCTAssertEqual(model.note, "500円分")
        XCTAssertEqual(model.content, "https://example.com")
        XCTAssertEqual(model.executedAt, Date(timeIntervalSince1970: 24 * 60 * 60))
    }
    
    func testモデルをエンティティに変換() throws {
        let uuid = UUID()
        let model = Persistence.AppNotification(
            id: uuid,
            userID: UUID(),
            kind: .sign,
            title: "あなたに対する制約が発行されました",
            noticedAt: Date(timeIntervalSince1970: 24 * 60 * 60),
            readAt: Date(timeIntervalSince1970: 2 * 24 * 60 * 60)
        )
        
        let expected = Entity.AppNotification(
            id: .init(uuid),
            kind: .sign,
            title: "あなたに対する制約が発行されました",
            noticedAt: Date(timeIntervalSince1970: 24 * 60 * 60),
            readAt: Date(timeIntervalSince1970: 2 * 24 * 60 * 60)
        )
        let actual = try model.toEntity
        XCTAssertEqual(actual, expected)
    }
}
