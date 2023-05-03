import Entity

/// 全てのフレンドを取得する
public protocol AllFriendsTakeable {
    func takeAll(of: User.ID) async throws -> [User]
}

/// フレンドを登録する
public protocol FriendRegisterable {
    func register(friend: User.ID, of: User.ID) async throws
}

/// フレンドを削除する
public protocol FriendDeletable {
    func delete(friend: User.ID, of: User.ID) async throws
}
