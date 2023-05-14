import Fluent

extension PushCondition {
    struct Migration: AsyncMigration {
        
        private let schema = "push_button_conditions"
        
        func prepare(on database: Database) async throws {
            try await database.schema(schema)
                .id()
                .field("task_id", .uuid, .required, .references("tasks", "id"))
                .field("completed_at", .datetime)
                .field("failed_at", .datetime)
                .field("created_at", .datetime, .required)
                .field("updated_at", .datetime, .required)
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(schema).delete()
        }
    }
}
