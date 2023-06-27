import Entity
import Foundation

/// タスク削除イベント
public struct AppTaskDeleteEvent: Hashable, Codable {

    public typealias ID = Identifier<Self>

    public var id: ID

    /// 対象タスクID
    public var taskID: AppTask.ID

    /// 発生日時
    public var at: Date

    public init(id: ID, taskID: AppTask.ID, at: Date) {
        self.id = id
        self.taskID = taskID
        self.at = at
    }

}
