import Fluent

public struct AppNotificationRepository {
    public var db: Database
    
    public init(on db: Database) {
        self.db = db
    }
}
