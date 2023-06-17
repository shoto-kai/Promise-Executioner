import Foundation
import Firebase
import Entity
import Usecase
import Repository
import ServiceProtocol

public struct BearerTokenPublisher<T: BearerUserSavible>: BearerTokenPublishable {
    
    var repository: T
    
    public init(_ repository: T) {
        self.repository = repository
    }
    
    public func publish(user: User) async throws -> BearerAuth.Token {
        let token = BearerAuth.Token(UUID().uuidString)
        try await repository.save(userID: user.id, token: token)
        return token
    }
}
