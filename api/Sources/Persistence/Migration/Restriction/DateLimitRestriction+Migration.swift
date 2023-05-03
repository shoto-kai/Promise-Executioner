import Fluent

extension DateLimitRestriction {
    struct Migration: AsyncMigration {
        
        private let schema = "date_limit_restrictions"
        
        func prepare(on database: Database) async throws {
            try await database.schema(schema)
                .id()
                .field("task_id", .uuid, .required, .references("tasks", "id"))
                .field("limit", .datetime, .required)
                .field("completed_at", .datetime)
                .field("created_at", .datetime, .required)
                .field("updated_at", .datetime, .required)
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(schema).delete()
        }
    }
}
