import Entity

/// 既読にする
protocol PairNotificationToReadable {
    func toRead(_ id: PairNotification.ID) async throws
}

/// ユーザーの通知一覧を取得する
protocol PairNotificationAllTakeable {
    func takeAll(of: User.ID) async throws -> [PairNotification]
}
