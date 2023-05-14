//import Fluent
//import Entity
//import Repository
//
//extension FriendRepository: AllFriendsTakeable {
//    public func takeAll(of userID: Entity.User.ID) async throws -> [Entity.User] {
//        try await Friend.query(on: db)
//            .filter(\.$user.$id == userID.value)
//            .with(\.$friend)
//            .all()
//            .map { try $0.friend.toEntity }
//    }
//}
