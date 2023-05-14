import Fluent

extension PushCondition.DeadlineRestriction {
    struct Migration: AsyncMigration {
        
        private let schema = "push_button_condition_deadline_restriction"
        
        func prepare(on database: Database) async throws {
            try await database.schema(schema)
                .id()
                .field("push_condition_id", .uuid, .required, .references("push_button_conditions", "id"))
                .field("deadline", .datetime, .required)
                .field("created_at", .datetime, .required)
                .field("updated_at", .datetime, .required)
                .create()
        }
        
        func revert(on database: Database) async throws {
            try await database.schema(schema).delete()
        }
    }
}
