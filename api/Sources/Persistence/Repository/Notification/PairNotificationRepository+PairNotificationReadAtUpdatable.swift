import Entity
import Fluent
import Foundation
import Repository

extension PairNotificationRepository: PairNotificationReadAtUpdatable {
    public func update(_ readAt: Date?, of notificationID: Entity.PairNotification.ID) async throws
    {
        guard let found = try await PairNotification.find(notificationID.value, on: db) else {
            throw DBError.notFound
        }
        found.readAt = readAt
        try await found.update(on: db)
    }
}
