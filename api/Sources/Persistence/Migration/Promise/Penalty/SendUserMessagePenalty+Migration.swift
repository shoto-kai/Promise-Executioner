import Fluent

extension SendUserMessagePenalty {
    struct Migration: AsyncMigration {

        private let schema = "send_user_message_penalties"

        func prepare(on database: FluentKit.Database) async throws {
            try await database.schema(schema)
                .id()
                .field("promise_id", .uuid, .required, .references("promises", "id"))
                .field("destine_user_id", .uuid, .required, .references("users", "id"))
                .field("amount", .int, .required)
                .field("note", .string, .required)
                .field("message", .string, .required)
                .field("created_at", .datetime, .required)
                .create()
            try await database.createIndex(schema: schema, columns: "promise_id")
            try await database.createIndex(schema: schema, columns: "destine_user_id")
        }

        func revert(on database: FluentKit.Database) async throws {
            try await database.schema(schema).delete()
        }
    }
}
