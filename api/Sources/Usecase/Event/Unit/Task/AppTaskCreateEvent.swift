import Foundation
import Entity

/// タスク作成イベント
public struct AppTaskCreateEvent: Hashable, Codable {
    
    public typealias ID = Identifier<Self>
    
    public var id: ID
    
    /// 対象タスク
    public var task: AppTask
    
    /// 発生日時
    public var at: Date
    
    public init(id: ID, task: AppTask, at: Date) {
        self.id = id
        self.task = task
        self.at = at
    }
    
}
