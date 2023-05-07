@testable import Entity
import XCTest

public final class NotificationTests: XCTestCase {
    
    func test通知日時の降順でソートできる() {
        let notifications: [AppNotification] = [
            .init(
                id: .init(.init(uuidString: "28D31C73-3CA1-46CF-A5FD-5540C8E8844B")!),
                kind: .gift,
                title: "",
                noticedAt: Date(timeIntervalSince1970: 3 * 24 * 60 * 60),
                readAt: Date(timeIntervalSince1970: 1 * 24 * 60 * 60)
            ),
            .init(
                id: .init(.init(uuidString: "42749355-F336-4DE1-AFFB-7942940E06F0")!),
                kind: .gift,
                title: "",
                noticedAt: Date(timeIntervalSince1970: 1 * 24 * 60 * 60),
                readAt: Date(timeIntervalSince1970: 2 * 24 * 60 * 60)
            ),
            .init(
                id: .init(.init(uuidString: "A378D636-D87F-4857-92F6-CE54344B6A03")!),
                kind: .gift,
                title: "",
                noticedAt: Date(timeIntervalSince1970: 2 * 24 * 60 * 60),
                readAt: Date(timeIntervalSince1970: 3 * 24 * 60 * 60)
            ),
        ]
        
        let expected: [AppNotification] = [
            .init(
                id: .init(.init(uuidString: "28D31C73-3CA1-46CF-A5FD-5540C8E8844B")!),
                kind: .gift,
                title: "",
                noticedAt: Date(timeIntervalSince1970: 3 * 24 * 60 * 60),
                readAt: Date(timeIntervalSince1970: 1 * 24 * 60 * 60)
            ),
            .init(
                id: .init(.init(uuidString: "A378D636-D87F-4857-92F6-CE54344B6A03")!),
                kind: .gift,
                title: "",
                noticedAt: Date(timeIntervalSince1970: 2 * 24 * 60 * 60),
                readAt: Date(timeIntervalSince1970: 3 * 24 * 60 * 60)
            ),
            .init(
                id: .init(.init(uuidString: "42749355-F336-4DE1-AFFB-7942940E06F0")!),
                kind: .gift,
                title: "",
                noticedAt: Date(timeIntervalSince1970: 1 * 24 * 60 * 60),
                readAt: Date(timeIntervalSince1970: 2 * 24 * 60 * 60)
            ),
        ]
        let actual = notifications.sorted()
        XCTAssertEqual(actual, expected)
    }
}
