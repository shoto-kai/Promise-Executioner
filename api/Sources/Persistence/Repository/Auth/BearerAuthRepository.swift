import Fluent

public struct BearerAuthRepository {

    var db: Database

    public init(on db: Database) {
        self.db = db
    }
}
