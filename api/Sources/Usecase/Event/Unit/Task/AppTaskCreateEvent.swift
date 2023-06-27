import Foundation
import Entity

/// タスク作成イベント
public struct AppTaskCreateEvent: Hashable, Codable {
    
    /// 対象タスク
    public var task: AppTask
    
    /// 発生日時
    public var at: Date
    
    public init(task: AppTask, at: Date) {
        self.task = task
        self.at = at
    }
    
}
