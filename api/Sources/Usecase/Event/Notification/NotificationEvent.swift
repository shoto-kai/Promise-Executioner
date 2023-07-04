import Entity
import Foundation

public enum NotificationEvent: Hashable, Codable, Comparable {
    case createSign(event: AppPromise.CreateEvent)
    case updateSign(event: AppPromise.UpdateEvent)
    case deleteSign(event: AppPromise.DeleteEvent)
    case breakPromise(event: AppPromise.BreakEvent)
    case fulFillPromise(event: AppPromise.FulfillEvent)

    public static func < (lhs: NotificationEvent, rhs: NotificationEvent) -> Bool {
        lhs.at < rhs.at
    }

    private var at: Date {
        switch self {
        case .createSign(let event):
            return event.at
        case .updateSign(let event):
            return event.at
        case .deleteSign(let event):
            return event.at
        case .breakPromise(let event):
            return event.at
        case .fulFillPromise(let event):
            return event.at
        }
    }

}
