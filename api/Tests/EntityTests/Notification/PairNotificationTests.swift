import Testing
import XCTest

@testable import Entity

public final class PairNotificationTests: XCTestCase {
    
    func test_sort時に通知時刻でソートされる() {
        var notification1 = PairNotification()
        notification1.noticedAt = .init(at: 1)
        
        
        var notification2 = PairNotification()
        notification2.noticedAt = .init(at: 2)
        
        
        var notification3 = PairNotification()
        notification3.noticedAt = .init(at: 3)
        
        let notifications = [
            notification3,
            notification1,
            notification2,
        ]
        
        let expected = [
            notification1,
            notification2,
            notification3,
        ]
        let actual = notifications.sorted()
        
        XCTAssertEqual(actual, expected)
    }
}
