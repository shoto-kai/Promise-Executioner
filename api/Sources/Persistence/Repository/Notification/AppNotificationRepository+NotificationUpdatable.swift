import Fluent
import Entity
import Repository

extension AppNotificationRepository: NotificationUpdatable {
    public func update(
        _ notification: Entity.AppNotification,
        of userID: Entity.User.ID
    ) async throws {
        guard let old = try await AppNotification.find(notification.id.value, on: db) else {
            throw DBError.notFound
        }
        let new = AppNotification(notification, of: userID)
        new.createdAt = old.createdAt
        new._$idExists = true
        try await new.update(on: db)
    }
}
