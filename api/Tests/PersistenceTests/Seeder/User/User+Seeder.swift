@testable import Persistence
import Foundation
import Fluent
import Entity

extension Persistence.User {
    struct Seeder: Seedable {

        static let entities: [Entity.User] = [
            .init(id: .init(UUID()), name: "Alice"),
            .init(id: .init(UUID()), name: "Bob"),
            .init(id: .init(UUID()), name: "Cancy"),
        ]

        static var models: [Persistence.User] {
            entities.map(User.init)
        }

        func seed(on db: Database) async throws {
            try await Self.models.create(on: db)
        }

        func refresh(on db: Database) async throws {
            try await User.query(on: db).delete()
        }

    }
}

