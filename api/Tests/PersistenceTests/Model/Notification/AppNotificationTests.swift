@testable import Persistence
import XCTest
import Entity

final class AppNotificationTests: XCTestCase {
    
    func testエンティティをモデルに変換() {
        let uuid = UUID()
        let userID = Entity.User.ID(UUID())
        let entity = Entity.AppNotification(
            id: .init(uuid),
            kind: .penalty,
            title: "ペナルティが執行されました",
            noticedAt: Date(timeIntervalSince1970: 24 * 60 * 60),
            readAt: Date(timeIntervalSince1970: 2 * 24 * 60 * 60)
        )
        
        let model: Persistence.AppNotification = .init(entity, of: userID)
        XCTAssertEqual(model.id, uuid)
        XCTAssertEqual(model.$user.id, userID.value)
        XCTAssertEqual(model.kind, .penalty)
        XCTAssertEqual(model.title, "ペナルティが執行されました")
        XCTAssertEqual(model.noticedAt, Date(timeIntervalSince1970: 24 * 60 * 60))
        XCTAssertEqual(model.readAt, Date(timeIntervalSince1970: 2 * 24 * 60 * 60))
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
