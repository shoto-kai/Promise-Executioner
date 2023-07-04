import Entity
import Foundation

public enum AppTaskChangeEvent: Hashable, Comparable {
    case create(event: AppPromise.CreateEvent)
    case update(event: AppPromise.UpdateEvent)
    case delete(event: AppPromise.DeleteEvent)

    public static func < (lhs: AppTaskChangeEvent, rhs: AppTaskChangeEvent) -> Bool {
        lhs.at < rhs.at
    }

    private var at: Date {
        switch self {
        case .create(let event):
            return event.at
        case .update(let event):
            return event.at
        case .delete(let event):
            return event.at
        }
    }
}
