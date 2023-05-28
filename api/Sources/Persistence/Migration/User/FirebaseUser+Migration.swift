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
                .field("iss", .string, .required)
                .field("phone_number", .string)
                .field("picture", .string)
                .field("sub", .string, .required)
                .field("uid", .string, .required)
                .field("sign_in_provider", .string, .required)
                .field("sign_in_second_factor", .string)
                .field("second_factor_identifier", .string)
                .field("tenant", .string)
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
