import Entity
import Foundation

/// タスク作成イベント
public struct AppTaskCreateEvent: Hashable, Codable {

    public typealias ID = Identifier<Self>

    public var id: ID

    public var user: User

    /// 対象タスク
    public var task: AppPromise

    /// 発生日時
    public var at: Date

    public init(id: ID, user: User, task: AppPromise, at: Date) {
        self.id = id
        self.user = user
        self.task = task
        self.at = at
    }

}
