import Entity
import ServiceProtocol
import Repository

public struct UpdateUserService<T: Repository.UserUpdatable>: ServiceProtocol.UserUpdatable {
    
    var updator: T
    
    public init(_ updator: T) {
        self.updator = updator
    }
    
    public func update(_ user: User) async throws {
        try await updator.update(user)
    }
}
