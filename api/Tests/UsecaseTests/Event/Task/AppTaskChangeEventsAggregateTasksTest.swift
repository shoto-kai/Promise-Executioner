import Entity
import Testing
import XCTest

@testable import Usecase

final class AppTaskChangeEventsAggregateTasksTest: XCTestCase {

    func test集約できる() {

        var promiseA = AppPromise()
        promiseA.title = "First"

        var createA = AppPromise.CreateEvent()
        createA.promise = promiseA
        createA.at = .init(at: 1)

        promiseA.title = "Second"
        var updateA1 = AppPromise.UpdateEvent()
        updateA1.promise = promiseA
        updateA1.at = .init(at: 2)

        promiseA.title = "Third"
        var updateA2 = AppPromise.UpdateEvent()
        updateA2.promise = promiseA
        updateA2.at = .init(at: 3)

        var promiseB = AppPromise()
        promiseB.title = "1番目"

        var createB = AppPromise.CreateEvent()
        createB.promise = promiseB
        createB.at = .init(at: 2)

        promiseB.title = "2番目"
        var updateB = AppPromise.UpdateEvent()
        updateB.promise = promiseB
        updateB.at = .init(at: 3)

        var promiseC = AppPromise()
        promiseC.title = "One"

        var createC = AppPromise.CreateEvent()
        createC.promise = promiseC
        createC.at = .init(at: 3)

        var deleteC = AppPromise.DeleteEvent()
        deleteC.promiseID = promiseC.id
        deleteC.at = .init(at: 4)

        let events: [AppTaskChangeEvent] = [
            .delete(event: deleteC),
            .create(event: createC),
            .update(event: updateB),
            .create(event: createB),
            .update(event: updateA1),
            .update(event: updateA2),
            .create(event: createA),
        ]

        let expected: Set<AppPromise> = [promiseA, promiseB]
        let actual = Set(events.aggregateTasks())
        XCTAssertEqual(actual, expected)
    }
}
