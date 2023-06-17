import Entity
import Usecase

/// Firebaseでトークン認証する
public protocol IDTokenAuthenticateService {
    func authenticate(token: Firebase.IDToken) async throws -> Firebase.User
}
