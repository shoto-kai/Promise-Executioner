import Fluent

extension AppPromiseBreakEvent {
    struct Migration: AsyncMigration {

        private let schema = "promise_break_events"

        func prepare(on database: FluentKit.Database) async throws {
            try await database.schema(schema)
                .id()
                .field("user_id", .uuid, .required, .references("users", "id"))
                .field("promise_entity_id", .uuid, .required)
                .field("created_at", .datetime, .required)
                .unique(on: "promise_entity_id")
                .create()
            try await database.createIndex(schema: schema, columns: "user_id")
            try await database.createIndex(schema: schema, columns: "created_at")
        }

        func revert(on database: FluentKit.Database) async throws {
            try await database.schema(schema).delete()
        }
    }
}