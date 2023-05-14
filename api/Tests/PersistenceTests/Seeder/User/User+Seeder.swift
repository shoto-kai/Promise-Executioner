//@testable import Persistence
//import Foundation
//import Fluent
//import Entity
//
//extension Persistence.User {
//    struct Seeder: Seedable {
//
//        static let entities: [Entity.User] = [
//            .init(id: .init(UUID()), name: .init("alice")!, displayName: "Alice"),
//            .init(id: .init(UUID()), name: .init("bob")!, displayName: "Bob"),
//            .init(id: .init(UUID()), name: .init("cancy")!, displayName: "Cancy"),
//            .init(id: .init(UUID()), name: .init("dragon")!, displayName: "Dragon"),
//            .init(id: .init(UUID()), name: .init("europe")!, displayName: "Europe"),
//            .init(id: .init(UUID()), name: .init("fanc")!, displayName: "Fanc"),
//            .init(id: .init(UUID()), name: .init("geograph")!, displayName: "Geograph"),
//        ]
//
//        static var models: [Persistence.User] {
//            entities.map { $0.toModel }
//        }
//
//        func seed(on db: Database) async throws {
//            try await Self.models.create(on: db)
//        }
//
//        func refresh(on db: Database) async throws {
//            try await User.query(on: db).delete()
//        }
//    }
//}
//
