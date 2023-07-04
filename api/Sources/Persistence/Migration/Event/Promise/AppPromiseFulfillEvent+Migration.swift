import Fluent

extension AppPromiseFulfillEvent {
    struct Migration: AsyncMigration {

        private let schema = "promise_fulfill_events"

        func prepare(on database: FluentKit.Database) async throws {
            try await database.schema(schema)
                .id()
                .field("promise_entity_id", .uuid, .required)
                .field("created_at", .datetime, .required)
                .unique(on: "promise_entity_id")
                .create()
            try await database.createIndex(schema: schema, columns: "created_at")
        }

        func revert(on database: FluentKit.Database) async throws {
            try await database.schema(schema).delete()
        }
    }
}
