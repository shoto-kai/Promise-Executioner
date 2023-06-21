import Entity
import Firebase
import Foundation
import Repository
import ServiceProtocol
import Usecase

public let bearerTokenExpireryMinutes = 60 * 24 /*[分]*/

public struct BearerTokenAuthenticator<
    UFBBT: UserFindableByBearerToken,
    OBAD: OldBearerAuthDeletable
>: BearerTokenAuthenticable {

    var finder: UFBBT
    var deleter: OBAD
    
    public init(finder: UFBBT, deleter: OBAD) {
        self.finder = finder
        self.deleter = deleter
    }

    public func authenticate(
        token: BearerAuth.Token,
        now: Date
    ) async throws -> User? {
        try await deleter.deleteBearerAuth(before: now)
        return try await finder.find(token)
    }
}
