import Entity
import Usecase

/// Firebaseでトークン認証する
public protocol UserFirebaseTokenAuthenticable {
    func authenticate(token: Firebase.Token) async throws -> User?
}

/// Bearerトークンで認証する
public protocol BearerTokenAuthenticable {
    func authenticate(token: String) async throws -> User?
}

/// Bearerトークンを作成する
public protocol BearerTokenGeneratable {
    func generate(of: User.ID) async throws -> BearerToken
}

/// Firebaseでユーザーを作成する
public protocol FirebaseUserCreatable {
    func create(user: Firebase.User) async throws
}

/// Firebaseで認証し、Firebaseのユーザーを作成し、Bearerトークンを発行する
public protocol FirebaseAuthenticateAndUserCreateAndBearerTokenGeneratable {
    func generate(token: Firebase.Token) async throws -> BearerToken
}
