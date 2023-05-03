import Fluent

extension AppTask {
    struct Migration: AsyncMigration {
        
        private let schema = "tasks"
        
        func prepare(on database: Database) async throws {
            try await database.schema(schema)
                .id()
                .field("user_id", .uuid, .required, .references("users", "id"))
                .field("title", .string, .required)
                .field("note", .string, .required)
                .field("created_at", .datetime, .required)
                .field("updated_at", .datetime, .required)
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(schema).delete()
        }
    }
}
