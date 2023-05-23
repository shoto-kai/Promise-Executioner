@testable import Entity
import XCTest
import Testing

public final class PairNotificationTests: XCTestCase {
    
    func test通知日時の昇順でソートできる() {
        var notifications = (1...3).map { _ in
            PairNotification.init()
        }
        notifications[0].noticedAt = .init(at: 3)
        notifications[1].noticedAt = .init(at: 2)
        notifications[2].noticedAt = .init(at: 1)
        
        var expected = notifications
        expected[0] = notifications[2]
        expected[2] = notifications[0]
        
        let actual = notifications.sorted()
        
        XCTAssertEqual(actual, expected)
    }
    
    func test既読判定() {
        var notification = PairNotification()
        notification.readAt = .init(at: 4)
        XCTAssertTrue(notification.isRead)
    }
    
    func test未読判定() {
        var notification = PairNotification()
        notification.readAt = nil
        XCTAssertFalse(notification.isRead)
    }
}
