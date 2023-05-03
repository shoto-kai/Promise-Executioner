import Foundation

public struct AppNotification: Hashable, Codable, Identifiable {
    
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

extension AppNotification {
    public struct ID: Hashable, Codable {
        public let value: UUID
        public init(_ value: UUID) {
            self.value = value
        }
    }
}
