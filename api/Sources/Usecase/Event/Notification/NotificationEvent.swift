import Entity
import Foundation

public enum NotificationEvent: Hashable, Codable, Comparable {
    case createSign(event: AppTaskCreateEvent)
    case updateSign(event: AppTaskUpdateEvent)
    case deleteSign(event: AppTaskDeleteEvent)
    case breakRestriction(event: BreakRestrictionEvent)
    case accomplishRestriction(event: AccomplishRestrictionEvent)

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
        case .breakRestriction(let event):
            return event.at
        case .accomplishRestriction(let event):
            return event.at
        }
    }

}
