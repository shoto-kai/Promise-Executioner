import Foundation
import Entity

/// 制約を破るイベント
public struct BreakRestrictionEvent: Hashable, Codable {
    
    /// 対象タスク
    public var task: AppTask
    
    /// 発生日時
    public var at: Date
    
}
