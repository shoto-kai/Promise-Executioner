import Entity
import Usecase

/// Bearerトークンで認証する
public protocol BearerTokenAuthenticable {
    func authenticate(token: BearerAuth.Token) async throws -> User?
}

/// Bearerトークンを発行する
public protocol BearerTokenPublishable {
    func publish(user: User) async throws -> BearerAuth.Token
}
