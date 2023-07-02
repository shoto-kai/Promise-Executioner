import Entity
import Foundation

/// 制約を達成するイベント
public struct AccomplishRestrictionEvent: Hashable, Codable {

    public typealias ID = Identifier<Self>

    public var id: ID

    /// 対象タスク
    public var task: AppPromise

    /// 発生日時
    public var at: Date

    public init(id: ID, task: AppPromise, at: Date) {
        self.id = id
        self.task = task
        self.at = at
    }

}
