import Entity

/// ユーザーを取得できる
public protocol UserFindable {
    func find(_ id: User.ID) async throws -> User?
}

// ユーザーを名前で取得できる
public protocol UserFindableByName {
    func find(_ name: User.Name) async throws -> User?
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

/// ユーザーを削除する
public protocol UserDeletable {
    func delete(_ userID: User.ID) async throws
}
