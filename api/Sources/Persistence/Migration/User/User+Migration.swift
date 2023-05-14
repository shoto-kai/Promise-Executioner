import Fluent

extension User {
    struct Migration: AsyncMigration {
        
        private let schema = "users"
        
        func prepare(on database: Database) async throws {
            try await database.schema(schema)
                .id()
                .field("name", .string, .required)
                .field("display_name", .string, .required)
                .field("created_at", .datetime, .required)
                .field("updated_at", .datetime, .required)
                .unique(on: "name")
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(schema).delete()
        }
    }
}
