import Foundation

public struct PairNotification: Hashable, Codable, Identifiable {
    
    public typealias ID = Identifier<Self>
    
    public var id: ID
    
    public var from: User
    
    public var to: User
    
    public var kind: NotificationKind
    
    public var title: String
    
    public var noticedAt: Date
    
    public var readAt: Date?
    
    public init(
        id: ID,
        from: User,
        to: User,
        kind: NotificationKind,
        title: String,
        noticedAt: Date,
        readAt: Date? = nil
    ) {
        self.id = id
        self.from = from
        self.to = to
        self.kind = kind
        self.title = title
        self.noticedAt = noticedAt
        self.readAt = readAt
    }
}

extension PairNotification: Comparable {
    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.noticedAt < rhs.noticedAt
    }
}
