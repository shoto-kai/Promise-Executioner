import Entity
import Foundation

/// ユーザーの全てのユーザー間通知を取得する
public protocol AllPairNotificationTakeable {
    func takeAll(of: User.ID) async throws -> [PairNotification]
}

/// ユーザー間通知を作成する
public protocol PairNotificationCreatable {
    func create(_ notification: PairNotification) async throws
}

/// ユーザー間通知のreadを更新する
public protocol PairNotificationReadAtUpdatable {
    func update(_ readAt: Date) async throws
}
