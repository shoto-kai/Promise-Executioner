//@testable import Persistence
//import Foundation
//import Fluent
//import Entity
//
//extension Persistence.User {
//    struct Seeder: Seedable {
//
//        static let entities: [Entity.User] = [
//            .init(id: .init(UUID()), name: "Alice"),
//            .init(id: .init(UUID()), name: "Bob"),
//            .init(id: .init(UUID()), name: "Cancy"),
//        ]
//
//        var models: [Persistence.User] {
//            [
//                .init(name: <#T##String#>)
//            ]
//        }
//
//        func seed(on: Database) async throws {
//            <#code#>
//        }
//
//        func refresh(on: Database) async throws {
//            <#code#>
//        }
//
//    }
//}

