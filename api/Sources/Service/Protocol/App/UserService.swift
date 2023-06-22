import Entity

/// ユーザー情報を更新する
public protocol UserUpdatable {
    func update(_ user: User) async throws
}
