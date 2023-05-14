//import Fluent
//import Entity
//import Repository
//
//extension AppNotificationRepository: NotificationCreatable {
//    public func create(
//        _ notification: Entity.AppNotification,
//        of userID: Entity.User.ID
//    ) async throws {
//        try await AppNotification(notification, of: userID).create(on: db)
//    }
//}
