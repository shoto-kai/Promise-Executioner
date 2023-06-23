import Fluent

@testable import Persistence

let seeders: [Seedable] = [
    User.Seeder(),
    FirebaseUser.Seeder(),
    BearerAuth.Seeder(),
]

func seed(on db: Database) async throws {
    for seeder in seeders.reversed() {
        try await seeder.refresh(on: db)
    }
    for seeder in seeders {
        try await seeder.seed(on: db)
    }
}
