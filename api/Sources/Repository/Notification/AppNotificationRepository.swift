import Entity

/// ユーザーの全ての通知を取得する
public protocol AllNotificationTakeable {
    func takeAll(of: User.ID) async throws -> [AppNotification]
}

/// 通知を探す
public protocol NotificationFindable {
    func find(_ id: AppNotification.ID) async throws -> AppNotification?
}

/// 通知を作成する
public protocol NotificationCreatable {
    func create(_ notification: AppNotification, of: User.ID) async throws
}

/// 通知を更新する
public protocol NotificationUpdatable {
    func update(_ notification: AppNotification, of: User.ID) async throws
}
