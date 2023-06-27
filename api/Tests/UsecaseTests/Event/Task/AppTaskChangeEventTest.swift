import XCTest
import Entity
import Testing

@testable import Usecase

final class AppTaskChangeEventTest: XCTestCase {
    
    func test並び替えするとat順に並ぶ() {
        let event1: AppTaskChangeEvent = .create(event: .init(id: .init(.init()), task: .init(), at: .init(at: 1)))
        let event2: AppTaskChangeEvent = .update(event: .init(id: .init(.init()), task: .init(), at: .init(at: 2)))
        let event3: AppTaskChangeEvent = .delete(event: .init(id: .init(.init()), taskID: .init(.init()), at: .init(at: 3)))
        
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
