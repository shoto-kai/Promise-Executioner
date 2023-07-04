import Entity
import Testing
import Usecase
import XCTest

@testable import Persistence

final class AppPromiseTests: XCTestCase {

    func testモデルへの変換() {
        let userID = Entity.User.ID()
        var promise = Entity.AppPromise()
        promise.title = "タイトル"
        promise.note = "ノート"

        let actual = promise.toModel(of: userID)

        XCTAssertEqual(actual.$user.id, userID.value)
        XCTAssertEqual(actual.title, "タイトル")
        XCTAssertEqual(actual.note, "ノート")
        XCTAssertEqual(actual.entityID, promise.id.value)
    }

    func testモデルからエンティティへの変換() throws {
        let promiseID = Entity.AppPromise.ID()

        var pushTaskDeadline = Entity.PushTask.DeadlineRestriction()
        pushTaskDeadline.at = .init(at: 5)

        let pushTask = Entity.AppPromise.Task.push(deadline: pushTaskDeadline)

        let pushTaskModel = pushTask.toPushTaskModel(of: promiseID)!
        pushTaskModel.$deadline.value = pushTaskDeadline.toModel(of: UUID())

        let destineUser = Entity.User()
        let sendUserMessagePenalty = Entity.Penalty.sendUserMessage(
            destine: destineUser,
            amount: .init(),
            note: "送金メモ",
            message: "送金メッセージ",
            state: .unexecuted
        )
        let sendUserMessagePenaltyModel = sendUserMessagePenalty.toSendUserMessagePenaltyModel(
            of: promiseID)!
        sendUserMessagePenaltyModel.$destineUser.value = destineUser.toModel

        let model = Persistence.AppPromise(
            userID: .init(),
            entityID: promiseID.value,
            title: "題名",
            note: "備考"
        )

        model.$pushTask.value = Entity.AppPromise.Task()
            .toPushTaskModel(of: promiseID)
        model.$pushTask.value = pushTaskModel
        model.$sendUserMessagePenalties.value = [sendUserMessagePenaltyModel]

        let actual = try model.toEntity

        let expected = Entity.AppPromise(
            id: promiseID,
            title: "題名",
            note: "備考",
            state: .incomplete,
            task: pushTask,
            penalties: [sendUserMessagePenalty]
        )
        XCTAssertEqual(actual, expected)
    }
}
