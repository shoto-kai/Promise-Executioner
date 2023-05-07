import Fluent
import Entity
import Repository

extension FriendRepository: FriendRegisterable {
    public func register(
        friend friendUserID: Entity.User.ID,
        of userID: Entity.User.ID
    ) async throws {
        try await Friend(
            userID: userID.value,
            friendUserID: friendUserID.value
        ).create(on: db)
    }
}
