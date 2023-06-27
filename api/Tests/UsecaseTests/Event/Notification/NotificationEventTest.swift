import XCTest
import Entity
import Testing

@testable import Usecase

final class NotificationEventTest: XCTestCase {
    
    func test並び替えするとat順に並ぶ() {
        let event1: NotificationEvent = .createSign(event: .init(id: .init(.init()), task: .init(), at: .init(at: 1)))
        let event2: NotificationEvent = .updateSign(event: .init(id: .init(.init()), task: .init(), at: .init(at: 2)))
        let event3: NotificationEvent = .deleteSign(event: .init(id: .init(.init()), taskID: .init(.init()), at: .init(at: 3)))
        let event4: NotificationEvent = .breakRestriction(event: .init(id: .init(.init()), task: .init(), at: .init(at: 4)))
        let event5: NotificationEvent = .accomplishRestriction(event: .init(id: .init(.init()), task: .init(), at: .init(at: 5)))
        
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
