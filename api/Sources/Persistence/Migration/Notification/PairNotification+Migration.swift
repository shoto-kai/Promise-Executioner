import Fluent

extension PairNotification {
    struct Migration: AsyncMigration {

        private let schema = "pair_notifications"

        func prepare(on database: Database) async throws {
            let kind = try await database.enum("notification_kinds").read()
            try await database.schema(schema)
                .id()
                .field("from_user_id", .uuid, .required, .references("users", "id"))
                .field("to_user_id", .uuid, .required, .references("users", "id"))
                .field("kind", kind, .required)
                .field("title", .string, .required)
                .field("noticed_at", .datetime, .required)
                .field("read_at", .datetime)
                .field("created_at", .datetime, .required)
                .field("updated_at", .datetime, .required)
                .create()
        }

        func revert(on database: Database) async throws {
            try await database.schema(schema).delete()
        }
    }
}
