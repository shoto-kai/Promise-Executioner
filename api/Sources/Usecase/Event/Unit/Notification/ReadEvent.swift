import Entity
import Foundation

public struct ReadEvent: Hashable, Codable {

    public var notificationEvent: NotificationEvent

    public var user: User

    public var at: Date

    public init(notificationEvent: NotificationEvent, user: User, at: Date) {
        self.notificationEvent = notificationEvent
        self.user = user
        self.at = at
    }
}
