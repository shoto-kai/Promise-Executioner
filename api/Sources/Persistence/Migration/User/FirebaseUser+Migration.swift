import Fluent

extension FirebaseUser {
    struct Migration: AsyncMigration {

        private let schema = "firebase_users"

        func prepare(on database: Database) async throws {
            try await database.schema(schema)
                .id()
                .field("user_id", .uuid, .required, .references("users", "id"))
                .field("email_verified", .bool)
                .field("email", .string)
                .field("picture", .string)
                .field("uid", .string, .required)
                .field("provider_id", .string, .required)
                .field("created_at", .datetime, .required)
                .field("updated_at", .datetime, .required)
                .unique(on: "user_id")
                .unique(on: "uid")
                .create()
        }

        func revert(on database: Database) async throws {
            try await database.schema(schema).delete()
        }
    }
}
