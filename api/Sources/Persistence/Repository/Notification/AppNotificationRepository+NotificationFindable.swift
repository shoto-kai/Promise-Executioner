import Fluent
import Entity
import Repository

extension AppNotificationRepository: NotificationFindable {
    public func find(_ id: Entity.AppNotification.ID) async throws -> Entity.AppNotification? {
        try await AppNotification.find(id.value, on: db)?.toEntity
    }
}
