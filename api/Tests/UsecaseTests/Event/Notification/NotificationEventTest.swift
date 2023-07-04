import Entity
import Testing
import XCTest

@testable import Usecase

final class NotificationEventTest: XCTestCase {

    func test並び替えするとat順に並ぶ() {

        var createEvent = AppPromise.CreateEvent()
        createEvent.at = .init(at: 1)
        let event1: NotificationEvent = .createSign(event: createEvent)

        var updateEvent = AppPromise.UpdateEvent()
        updateEvent.at = .init(at: 2)
        let event2: NotificationEvent = .updateSign(event: updateEvent)

        var deleteEvent = AppPromise.DeleteEvent()
        deleteEvent.at = .init(at: 3)
        let event3: NotificationEvent = .deleteSign(event: deleteEvent)

        var breakEvent = AppPromise.BreakEvent()
        breakEvent.at = .init(at: 4)
        let event4: NotificationEvent = .breakPromise(event: breakEvent)

        var accomplishEvent = AppPromise.FulfillEvent()
        accomplishEvent.at = .init(at: 5)
        let event5: NotificationEvent = .fulFillPromise(event: accomplishEvent)

        let events = [
            event2,
            event4,
            event3,
            event5,
            event1,
        ]

        let expected = [
            event1,
            event2,
            event3,
            event4,
            event5,
        ]
        let actual = events.sorted()
        XCTAssertEqual(actual, expected)
    }
}
