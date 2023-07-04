import Fluent
import PostgresKit

extension AppPromise {
    struct Migration: AsyncMigration {

        private let schema = "promises"

        func prepare(on database: FluentKit.Database) async throws {
            try await database.schema(schema)
                .id()
                .field("user_id", .uuid, .required, .references("users", "id"))
                .field("entity_id", .uuid, .required)
                .field("title", .string, .required)
                .field("note", .string, .required)
                .field("created_at", .datetime, .required)
                .create()
            try await database.createIndex(schema: schema, columns: "user_id")
            try await database.createIndex(schema: schema, columns: "entity_id")
        }

        func revert(on database: FluentKit.Database) async throws {
            try await database.schema(schema).delete()
        }
    }
}
