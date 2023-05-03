@testable import Entity
import XCTest

public final class NotificationTests: XCTestCase {
    
    public static let values: [AppNotification] = [
        .init(
            id: .init(UUID()),
            kind: .gift,
            title: "田中のペナルティによるプレゼント通知",
            noticedAt: Date(timeIntervalSince1970: 10 * 24 * 60 * 60)
        ),
        .init(
            id: .init(UUID()),
            kind: .penalty,
            title: "ペナルティが発生",
            noticedAt: Date(timeIntervalSince1970: 20 * 24 * 60 * 60),
            readAt: Date(timeIntervalSince1970: 21 * 24 * 60 * 60)
        ),
        .init(
            id: .init(UUID()),
            kind: .sign,
            title: "田中と制約発生",
            noticedAt: Date(timeIntervalSince1970: 30 * 24 * 60 * 60),
            readAt: Date(timeIntervalSince1970: 31 * 24 * 60 * 60)
        ),
    ]
}
