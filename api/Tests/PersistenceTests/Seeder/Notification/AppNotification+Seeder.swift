@testable import Persistence
import Foundation
import Fluent
import Entity

extension Persistence.AppNotification {
    struct Seeder: Seedable {

        static let entities: [Entity.AppNotification] = [
            .init(
                id: .init(.init()),
                kind: .gift,
                title: "青木さんのペナルティが届きました",
                noticedAt: Date(timeIntervalSince1970: 1 * 24 * 60 * 60),
                readAt: Date(timeIntervalSince1970: 2 * 24 * 60 * 60)
            ),
            .init(
                id: .init(.init()),
                kind: .penalty,
                title: "BBQ18時集合失敗のペナルティが発生しました。",
                noticedAt: Date(timeIntervalSince1970: 2 * 24 * 60 * 60),
                readAt: Date(timeIntervalSince1970: 3 * 24 * 60 * 60)
            ),
            .init(
                id: .init(.init()),
                kind: .sign,
                title: "伊藤さんがあなたとの制約を設けました",
                noticedAt: Date(timeIntervalSince1970: 3 * 24 * 60 * 60)
            ),
        ]

        static var models: [Persistence.AppNotification] {
            entities.map { entity in
                    .init(entity, of: User.Seeder.entities[0].id)
            }
        }

        func seed(on db: Database) async throws {
            try await Self.models.create(on: db)
        }

        func refresh(on db: Database) async throws {
            try await AppNotification.query(on: db).delete()
        }

    }
}

