import Fluent

extension BearerAuth {
    struct Migration: AsyncMigration {

        private let schema = "bearer_authes"

        func prepare(on database: Database) async throws {
            try await database.schema(schema)
                .id()
                .field("user_id", .uuid, .required, .references("users", "id"))
                .field("token", .string)
                .field("created_at", .datetime, .required)
                .field("updated_at", .datetime, .required)
                .unique(on: "user_id")
                .create()
        }

        func revert(on database: Database) async throws {
            try await database.schema(schema).delete()
        }

    }
}
