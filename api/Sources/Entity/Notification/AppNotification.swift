import Foundation

public struct AppNotification: Hashable, Codable, Identifiable {
    
    public typealias ID = Identifier<AppNotification>
    
    public var id: ID
    
    public var kind: Kind
    
    public var title: String
    
    public var noticedAt: Date
    
    public var readAt: Date?
    
    public init(
        id: ID,
        kind: Kind,
        title: String,
        noticedAt: Date,
        readAt: Date? = nil
    ) {
        self.id = id
        self.kind = kind
        self.title = title
        self.noticedAt = noticedAt
        self.readAt = readAt
    }
}

extension AppNotification: Comparable {
    public static func < (lhs: AppNotification, rhs: AppNotification) -> Bool {
        lhs.noticedAt > rhs.noticedAt
    }
}
