import Foundation
import Entity
import Fluent
import Repository
import Usecase

extension BearerAuthRepository: OldBearerAuthDeletable {
    public func deleteBearerAuth(before: Date) async throws {
        try await BearerAuth.query(on: db)
            .filter(\.$createdAt < before)
            .delete()
    }
}
