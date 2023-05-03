import Foundation

/// 期限内達成制約
public struct DateLimitRestriction: Hashable, Codable {
    
    public typealias ID = Identifier<DateLimitRestriction>
    
    public var id: ID
        
    /// 期限日
    public var limit: Date
    
    /// 完了日
    public var completedAt: Date?
    
    public init(id: ID, limit: Date, completedAt: Date? = nil) {
        self.id = id
        self.limit = limit
        self.completedAt = completedAt
    }
    
}
