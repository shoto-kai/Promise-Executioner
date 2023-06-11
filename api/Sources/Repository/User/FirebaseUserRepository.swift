import Usecase
import Entity

/// uidでFirebaseユーザーを取得する
public protocol FirebaseUserFindable {
    func find(uid: String) async throws -> Firebase.User?
}

/// Firebaseユーザーを作成する
public protocol FirebaseUserCreatable {
    func create(_ user: Firebase.User) async throws
}

/// Firebaseユーザーを削除する
public protocol FirebaseUserDeletableByUserID {
    func delete(_ userID: Entity.User.ID) async throws
}
