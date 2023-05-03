import Fluent

extension Friend {
    struct Migration: AsyncMigration {
        
        private let schema = "friends"
        
        func prepare(on database: Database) async throws {
            try await database.schema(schema)
                .id()
                .field("user_id", .uuid, .required, .references("users", "id"))
                .field("friend_user_id", .uuid, .required, .references("users", "id"))
                .field("created_at", .datetime, .required)
                .field("updated_at", .datetime, .required)
                .unique(on: "user_id", "friend_user_id")
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(schema).delete()
        }
    }
}
