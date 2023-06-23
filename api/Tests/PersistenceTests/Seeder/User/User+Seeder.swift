import Entity
import Fluent
import Foundation

@testable import Persistence

extension Persistence.User {
    struct Seeder: Seedable {

        static let entities: [Entity.User] = [
            try! .init(id: .init(UUID()), name: .init("alice"), displayName: "Alice"),
            try! .init(id: .init(UUID()), name: .init("bob"), displayName: "Bob"),
            try! .init(id: .init(UUID()), name: .init("cancy"), displayName: "Cancy"),
            try! .init(id: .init(UUID()), name: .init("dragon"), displayName: "Dragon"),
            try! .init(id: .init(UUID()), name: .init("europe"), displayName: "Europe"),
            try! .init(id: .init(UUID()), name: .init("fanc"), displayName: "Fanc"),
            try! .init(id: .init(UUID()), name: .init("geograph"), displayName: "Geograph"),
        ]

        static var models: [Persistence.User] {
            entities.map { $0.toModel }
        }

        func seed(on db: Database) async throws {
            try await Self.models.create(on: db)
        }

        func refresh(on db: Database) async throws {
            try await User.query(on: db).delete()
        }
    }
}
