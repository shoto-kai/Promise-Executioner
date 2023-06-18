import Entity
import Fluent
import Foundation
import Usecase

@testable import Persistence

extension Persistence.FirebaseUser {
    struct Seeder: Seedable {

        static let entities: [Firebase.User] = [
            .init(
                user: User.Seeder.entities[0],
                emailVerified: true,
                email: "alice@example.com",
                picture: "https://example.com/picture/alice",
                uid: "alice_uid",
                providerId: "email"
            ),
            .init(
                user: User.Seeder.entities[1],
                emailVerified: true,
                email: "bob@example.com",
                picture: "https://example.com/picture/bob",
                uid: "bob_uid",
                providerId: nil
            ),
            .init(
                user: User.Seeder.entities[2],
                emailVerified: false,
                email: "cancy@example.com",
                picture: "https://example.com/picture/cancy",
                uid: "cancy_uid",
                providerId: nil
            ),
        ]

        static var models: [Persistence.FirebaseUser] {
            entities.map { $0.toModel }
        }

        func seed(on db: Database) async throws {
            try await Self.models.create(on: db)
        }

        func refresh(on db: Database) async throws {
            try await FirebaseUser.query(on: db).delete()
        }
    }
}
