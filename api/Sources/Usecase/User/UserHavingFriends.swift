import Entity

public struct UserHavingFriends: Hashable, Codable, Identifiable {
    
    public var id: User.ID
    
    public var friends: [User]
    
    public init(id: User.ID, friends: [User]) {
        self.id = id
        self.friends = friends
    }
}
