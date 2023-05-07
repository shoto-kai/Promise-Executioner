@testable import Persistence
import XCTest
import Entity

final class AppTaskTests: XCTestCase {
    
    func testエンティティをモデルに変換() {
        let uuid = UUID()
        let userID = Entity.User.ID(.init())
        let entity = Entity.AppTask(
            id: .init(uuid),
            title: "タスクタイトル",
            note: "タスクメモ",
            restrictions: .init(dateLimitRestrictions: []),
            penalties: .init(sendUserPenalties: [])
        )
        
        let model: Persistence.AppTask = .init(entity, of: userID)
        XCTAssertEqual(model.id, uuid)
        XCTAssertEqual(model.$user.id, userID.value)
        XCTAssertEqual(model.title, "タスクタイトル")
        XCTAssertEqual(model.note, "タスクメモ")
    }
    
    func testモデルをエンティティに変換() throws {
        let uuid = UUID()
        let dateLimitRestrictions = [Entity.DateLimitRestriction(
            id: .init(.init()),
            limit: Date(timeIntervalSince1970: 5 * 24 * 60 * 60)
        )]
        let sendUserPenalties = [Entity.SendUserPenalty(
            id: .init(.init()),
            destination: .init(id: .init(UUID()), name: "田中"),
            overview: "ペナルティ概要",
            note: "ペナルティメモ",
            content: "ペナルティ内容"
        )]
        
        
        let model = Persistence.AppTask(
            id: uuid,
            userID: UUID(),
            title: "たいとる",
            note: "めも"
        )
        model.$sendUserPenalties.value = sendUserPenalties.map { entity in
            let model = SendUserPenalty(entity, of: .init(uuid))
            model.$destinationUser.value = .init(entity.destination)
            return model
        }
        model.$dateLimitRestrictions.value = dateLimitRestrictions.map { entity in
            DateLimitRestriction(entity, of: .init(uuid))
        }
        
        let expected = Entity.AppTask(
            id: .init(uuid),
            title: "たいとる",
            note: "めも",
            restrictions: .init(dateLimitRestrictions: dateLimitRestrictions),
            penalties: .init(sendUserPenalties: sendUserPenalties)
        )
        let actual = try model.toEntity
        XCTAssertEqual(actual, expected)
    }
}
