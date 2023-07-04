import Fluent

extension AppPromiseUpdateEvent {
    struct Migration: AsyncMigration {

        private let schema = "promise_update_events"

        func prepare(on database: FluentKit.Database) async throws {
            try await database.schema(schema)
                .id()
                .field("user_id", .uuid, .required, .references("users", "id"))
                .field("promise_id", .uuid, .required, .references("promises", "id"))
                .field("created_at", .datetime, .required)
                .create()
            try await database.createIndex(schema: schema, columns: "user_id")
            try await database.createIndex(schema: schema, columns: "promise_id")
            try await database.createIndex(schema: schema, columns: "created_at")
        }

        func revert(on database: FluentKit.Database) async throws {
            try await database.schema(schema).delete()
        }
    }
}
