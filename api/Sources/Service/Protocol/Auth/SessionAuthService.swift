import Entity
import Usecase

/// セッション認証
public protocol SessionAuthenticable {
    func authenticate() async throws -> User?
}

/// セッション認証を解除する
public protocol SessionAuthDestroyable {
    func destroy() async throws
}

/// セッション認証を登録できる
public protocol SessionAuthRegisterable {
    func register(userID: User.ID) async throws
}
