import Entity

/// ユーザーを取得できる
public protocol UserFindable {
    func find(_ id: User.ID) async throws -> User?
}

/// 全てのユーザーを取得できる
public protocol AllUserTakeable {
    func takeAll() async throws -> [User]
}

/// ユーザーを作成する
public protocol UserCreatable {
    func create(_ user: User) async throws
}

/// ユーザーを更新する
public protocol UserUpdatable {
    func update(_ user: User) async throws
}
