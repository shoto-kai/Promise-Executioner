import Foundation
import Fluent

final class Friend: Model {
    
    static let schema = "friends"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "user_id")
    var user: User
    
    @Parent(key: "friend_user_id")
    var friend: User
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
    
    init() { }
    
    init(id: UUID? = nil, userID: User.IDValue, friendUserID: User.IDValue) {
        self.id = id
        self.$user.id = userID
        self.$friend.id = friendUserID
    }
}

