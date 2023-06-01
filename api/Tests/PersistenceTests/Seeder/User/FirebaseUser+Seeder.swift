@testable import Persistence
import Foundation
import Fluent
import Entity
import Usecase

extension Persistence.FirebaseUser {
    struct Seeder: Seedable {

        static let entities: [Firebase.User] = [
            .init(
                user: User.Seeder.entities[0],
                emailVerified: true,
                email: "alice@example.com",
                firebase: .init(signInProvider: "email"),
                iss: "Firebase",
                phoneNumber: "+1234567890",
                picture: "https://example.com/picture/alice",
                sub: "alice_sub",
                uid: "alice_uid"
            ),
            .init(
                user: User.Seeder.entities[1],
                emailVerified: true,
                email: "bob@example.com",
                firebase: .init(signInProvider: "email"),
                iss: "Firebase",
                phoneNumber: "+0987654321",
                picture: "https://example.com/picture/bob",
                sub: "bob_sub",
                uid: "bob_uid"
            ),
            .init(
                user: User.Seeder.entities[2],
                emailVerified: false,
                email: "cancy@example.com",
                firebase: .init(signInProvider: "email"),
                iss: "Firebase",
                phoneNumber: "+1122334455",
                picture: "https://example.com/picture/cancy",
                sub: "cancy_sub",
                uid: "cancy_uid"
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
