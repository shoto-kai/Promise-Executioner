import Entity
import Fluent
import Foundation

@testable import Persistence

extension Persistence.BearerAuth {
    struct Seeder: Seedable {
        
        static var models: [Persistence.BearerAuth] {
            [
                .init(userID: users[0].id.value, token: "token1"),
                .init(userID: users[1].id.value, token: "token2"),
            ]
        }
        private static var users: [Entity.User] {
            Persistence.User.Seeder.entities
        }
        
        func seed(on db: Database) async throws {
            try await Self.models.create(on: db)
        }
        
        func refresh(on db: Database) async throws {
            try await BearerAuth.query(on: db).delete()
        }
    }
}
