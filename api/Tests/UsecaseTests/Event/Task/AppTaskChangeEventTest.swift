import XCTest
import Entity
import Testing

@testable import Usecase

final class AppTaskChangeEventTest: XCTestCase {
    
    func test並び替えするとat順に並ぶ() {
        var createEvent = AppTaskCreateEvent()
        createEvent.at = .init(at: 1)
        let event1: AppTaskChangeEvent = .create(event: createEvent)
        
        var updateEvent = AppTaskUpdateEvent()
        updateEvent.at = .init(at: 2)
        let event2: AppTaskChangeEvent = .update(event: updateEvent)
        
        var deleteEvent = AppTaskDeleteEvent()
        deleteEvent.at = .init(at: 3)
        let event3: AppTaskChangeEvent = .delete(event: deleteEvent)
        
        let events = [
            event2,
            event3,
            event1,
        ]
        
        let expected = [
            event1,
            event2,
            event3,
        ]
        let actual = events.sorted()
        XCTAssertEqual(actual, expected)
    }
}
