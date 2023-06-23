import Entity
import Firebase
import Foundation
import Repository
import ServiceProtocol
import Usecase
import Vapor

private let sessionKey = "session-auth-user-id"

public struct SessionAuthService<UserFinder: UserFindable>: SessionAuthenticable {

    private var session: Vapor.Session
    private var userFinder: UserFinder

    public init(session: Vapor.Session, userFinder: UserFinder) {
        self.session = session
        self.userFinder = userFinder
    }

    public func authenticate() async throws -> Entity.User? {
        guard let userID else {
            return nil
        }
        return try await userFinder.find(userID)
    }

    private var userID: Entity.User.ID? {
        session.data[sessionKey]
            .flatMap(UUID.init(uuidString:))
            .map(User.ID.init)
    }
}

extension SessionAuthService: SessionAuthRegisterable {
    public func register(userID: Entity.User.ID) async throws {
        session.data[sessionKey] = userID.value.uuidString
    }
}

extension SessionAuthService: SessionAuthDestroyable {
    public func destroy() async throws {
        session.data[sessionKey] = nil
    }
}
