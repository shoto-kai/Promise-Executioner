import Foundation
import Firebase
import Entity
import Usecase
import Repository
import ServiceProtocol

public struct BearerTokenAuthenticator<T: UserFindableByBearerToken>: BearerTokenAuthenticable {

    var repository: T
    
    public init(_ repository: T) {
        self.repository = repository
    }
    
    public func authenticate(token: BearerAuth.Token) async throws -> User? {
        try await repository.find(token)
    }
    
}
