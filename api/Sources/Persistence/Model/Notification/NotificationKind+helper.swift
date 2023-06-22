import Entity
import Foundation

extension Entity.NotificationReadState {
    var readAt: Date? {
        guard case .read(let at) = self else {
            return nil
        }
        return at
    }

    init(at date: Date?) {
        if let date {
            self = .read(at: date)
        } else {
            self = .unread
        }
    }
}
