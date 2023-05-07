@testable import Persistence
import Foundation
import Fluent
import Entity

extension Persistence.Friend {
    struct Seeder: Seedable {

        static let entities: [(owner: Entity.User, friend: Entity.User)] = [
            (User.Seeder.entities[0], User.Seeder.entities[1]),
            (User.Seeder.entities[0], User.Seeder.entities[2]),
            (User.Seeder.entities[1], User.Seeder.entities[0]),
        ]

        static var models: [Persistence.Friend] {
            entities.map { (entity) in
                let (owner, friend) = entity
                return .init(
                    userID: owner.id.value,
                    friendUserID: friend.id.value
                )
            }
        }

        func seed(on db: Database) async throws {
            try await Self.models.create(on: db)
        }

        func refresh(on db: Database) async throws {
            try await Friend.query(on: db).delete()
        }

    }
}

