import Foundation

public struct AppTask: Hashable, Codable {
    
    public var id: ID
    
    public var title: String
    
    public var note: String
    
    public var restrictions: Restrictions
    
    public var penalties: Penalties
    
    public init(id: ID, title: String, note: String, restrictions: Restrictions, penalties: Penalties) {
        self.id = id
        self.title = title
        self.note = note
        self.restrictions = restrictions
        self.penalties = penalties
    }
}

extension AppTask {
    public struct ID: Hashable, Codable {
        public let value: UUID
        public init(_ value: UUID) {
            self.value = value
        }
    }
}
