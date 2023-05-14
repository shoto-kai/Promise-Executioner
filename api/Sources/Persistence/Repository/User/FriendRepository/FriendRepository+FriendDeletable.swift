//import Fluent
//import Entity
//import Repository
//
//extension FriendRepository: FriendDeletable {
//    public func delete(
//        friend friendUserID: Entity.User.ID,
//        of userID: Entity.User.ID
//    ) async throws {
//        guard let model = try await Friend.query(on: db)
//            .filter(\.$user.$id == userID.value)
//            .filter(\.$friend.$id == friendUserID.value)
//            .first()
//        else {
//            throw DBError.notFound
//        }
//        try await model.delete(on: db)
//    }
//}
