import Fluent
import PostgresKit

extension PushTask {
    struct Migration: AsyncMigration {

        private let schema = "push_tasks"

        func prepare(on database: FluentKit.Database) async throws {
            try await database.schema(schema)
                .id()
                .field("promise_id", .uuid, .required, .references("promises", "id"))
                .field("created_at", .datetime, .required)
                .create()
            try await database.createIndex(schema: schema, columns: "promise_id")
        }

        func revert(on database: FluentKit.Database) async throws {
            try await database.schema(schema).delete()
        }
    }
}
