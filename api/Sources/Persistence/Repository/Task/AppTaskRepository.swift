import Fluent

public struct AppTaskRepository {

    var db: Database

    public init(on db: Database) {
        self.db = db
    }
}
