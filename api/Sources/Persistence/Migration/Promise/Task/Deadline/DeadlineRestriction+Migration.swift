import Fluent
import PostgresKit

extension PushTask.DeadlineRestriction {
    struct Migration: AsyncMigration {

        private let schema = "push_task_deadline_restriction"

        func prepare(on database: FluentKit.Database) async throws {
            try await database.schema(schema)
                .id()
                .field("push_task_id", .uuid, .required, .references("push_tasks", "id"))
                .field("deadline", .datetime, .required)
                .field("created_at", .datetime, .required)
                .create()
            try await database.createIndex(schema: schema, columns: "push_task_id")
        }

        func revert(on database: FluentKit.Database) async throws {
            try await database.schema(schema).delete()
        }
    }
}
