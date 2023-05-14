import Fluent

extension SendMessageToUserPenalty {
    struct Migration: AsyncMigration {
        
        private let schema = "send_message_to_user_penalties"
        
        func prepare(on database: Database) async throws {
            try await database.schema(schema)
                .id()
                .field("task_id", .uuid, .required, .references("tasks", "id"))
                .field("destine_user_id", .uuid, .required, .references("users", "id"))
                .field("amount", .int, .required)
                .field("note", .string, .required)
                .field("message", .string, .required)
                .field("executed_at", .datetime)
                .field("created_at", .datetime, .required)
                .field("updated_at", .datetime, .required)
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(schema).delete()
        }
    }
}
