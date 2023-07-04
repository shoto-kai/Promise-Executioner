import Entity
import Testing
import Usecase
import XCTest

@testable import Persistence

final class SendUserMessagePenaltyTests: XCTestCase {

    func testモデルへの変換() {
        let destineUser = Entity.User()
        let promiseID = Entity.AppPromise.ID()
        let penalty = Entity.Penalty.sendUserMessage(
            destine: destineUser,
            amount: .init(100),
            note: .init("note"),
            message: .init("message"),
            state: .unexecuted
        )

        let actual = penalty.toSendUserMessagePenaltyModel(of: promiseID)

        guard let actual else {
            XCTFail()
            return
        }
        XCTAssertEqual(actual.$destineUser.id, destineUser.id.value)
        XCTAssertEqual(actual.amount, 100)
        XCTAssertEqual(actual.note, "note")
        XCTAssertEqual(actual.message, "message")
    }

    func testモデルからエンティティへの変換() throws {
        let destineUser = Entity.User()
        let promiseID = Entity.AppPromise.ID()
        let model = Persistence.SendUserMessagePenalty(
            promiseID: promiseID.value,
            destineUserID: destineUser.id.value,
            amount: 1000,
            note: "ノート",
            message: "メッセージ"
        )
        model.$destineUser.value = destineUser.toModel

        let actual = try model.toEntity

        let expected = Entity.Penalty.sendUserMessage(
            destine: destineUser,
            amount: .init(1000),
            note: .init("ノート"),
            message: .init("メッセージ"),
            state: .unexecuted
        )
        XCTAssertEqual(actual, expected)
    }
}
