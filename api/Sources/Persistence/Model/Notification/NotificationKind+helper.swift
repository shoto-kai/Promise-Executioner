import Entity
import Foundation

extension Entity.NotificationReadState {
    var readAt: Date? {
        guard case .read(let at) = self else {
            return nil
        }
        return at
    }
}
