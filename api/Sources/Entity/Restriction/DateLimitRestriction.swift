import Foundation

/// 期限内達成制約
public struct DateLimitRestriction: Hashable, Codable {
    
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

extension DateLimitRestriction {
    public struct ID: Hashable, Codable {
        public let value: UUID
        public init(value: UUID) {
            self.value = value
        }
    }
}
