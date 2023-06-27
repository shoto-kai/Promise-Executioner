import Foundation
import Entity

/// タスク削除イベント
public struct AppTaskDeleteEvent: Hashable, Codable {
    
    /// 対象タスクID
    public var taskID: AppTask.ID
    
    /// 発生日時
    public var at: Date
    
    public init(taskID: AppTask.ID, at: Date) {
        self.taskID = taskID
        self.at = at
    }
    
}
