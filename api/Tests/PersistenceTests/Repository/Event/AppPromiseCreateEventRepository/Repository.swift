import Fluent

public struct AppPromiseCreateEventRepository {

    var db: Database

    public init(on db: Database) {
        self.db = db
    }
}
