import Foundation
import Entity

/// タスク更新イベント
public struct AppTaskUpdateEvent: Hashable, Codable {
    
    /// 対象タスク
    public var task: AppTask
    
    /// 発生日時
    public var at: Date
    
    public init(task: AppTask, at: Date) {
        self.task = task
        self.at = at
    }
    
}
