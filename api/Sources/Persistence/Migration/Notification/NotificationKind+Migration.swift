import Fluent
import Entity

extension NotificationKind {
    struct Migration: AsyncMigration {
        
        private let schema = "notification_kinds"
        
        func prepare(on database: Database) async throws {
            _ = try await database.enum(schema)
                .case("gift")
                .case("penalty")
                .case("sign")
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(schema).delete()
        }
    }
}
