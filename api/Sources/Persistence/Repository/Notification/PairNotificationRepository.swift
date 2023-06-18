import Fluent

public struct PairNotificationRepository {
    var db: Database

    public init(on db: Database) {
        self.db = db
    }
}
