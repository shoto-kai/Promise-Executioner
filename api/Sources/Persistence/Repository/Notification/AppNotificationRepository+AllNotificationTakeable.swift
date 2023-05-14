//import Fluent
//import Entity
//import Repository
//
//extension AppNotificationRepository: AllNotificationTakeable {
//    public func takeAll(of userID: Entity.User.ID) async throws -> [Entity.AppNotification] {
//        try await AppNotification.query(on: db)
//            .filter(\.$user.$id == userID.value)
//            .all()
//            .map { try $0.toEntity }
//    }
//}
