import Entity
import Firebase
import Foundation
import Repository
import ServiceProtocol
import Usecase

public struct BearerTokenAuthenticator<T: UserFindableByBearerToken>: BearerTokenAuthenticable {

    var repository: T

    public init(_ repository: T) {
        self.repository = repository
    }

    public func authenticate(token: BearerAuth.Token) async throws -> User? {
        try await repository.find(token)
    }

}
