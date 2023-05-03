import Fluent

extension AppNotification {
    struct Migration: AsyncMigration {
        
        private let schema = "notifications"
        private let kindSchema = "notification_kinds"
        
        func prepare(on database: Database) async throws {
            let notificationKinds = try await database.enum(kindSchema)
                .case("gift")
                .case("penalty")
                .case("sign")
                .create()
            
            try await database.schema(schema)
                .id()
                .field("user_id", .uuid, .required, .references("users", "id"))
                .field("kind", notificationKinds, .required)
                .field("title", .string, .required)
                .field("noticed_at", .datetime, .required)
                .field("read_at", .datetime)
                .field("created_at", .datetime, .required)
                .field("updated_at", .datetime, .required)
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(schema).delete()
            try await database.enum(kindSchema).delete()
        }
    }
}
