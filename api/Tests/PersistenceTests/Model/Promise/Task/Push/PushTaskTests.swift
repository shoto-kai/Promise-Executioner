import Entity
import Testing
import Usecase
import XCTest

@testable import Persistence

final class PushTaskTests: XCTestCase {

    func testモデルへの変換() {
        let task = Entity.AppPromise.Task.push(deadline: .init())
        let promiseID = Entity.AppPromise.ID()
        let actual = task.toPushTaskModel(of: promiseID)

        guard let actual else {
            XCTFail()
            return
        }
        XCTAssertEqual(actual.$promise.id, promiseID.value)
    }

    func testモデルからエンティティへの変換() {
        let modelID = UUID()
        let model = Persistence.PushTask(
            id: modelID,
            promiseID: .init()
        )
        let deadline = Entity.PushTask.DeadlineRestriction(.init(at: 10))
        model.$deadline.value = deadline.toModel(of: modelID)

        let actual = model.toEntity

        let expected = Entity.AppPromise.Task.push(deadline: deadline)
        XCTAssertEqual(actual, expected)
    }
}
