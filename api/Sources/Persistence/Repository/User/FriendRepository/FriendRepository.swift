import Fluent

public struct FriendRepository {
    public var db: Database
    
    public init(on db: Database) {
        self.db = db
    }
}
