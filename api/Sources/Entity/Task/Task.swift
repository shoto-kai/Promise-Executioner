import Foundation

public struct Task: Hashable, Codable {
    
    public var id: ID
    
    public var title: String
    
    public var note: String
    
    public var restrictions: Restrictions
    
    public var penalties: Penalties
}

extension Task {
    public struct ID: Hashable, Codable {
        public let value: UUID
        public init(_ value: UUID) {
            self.value = value
        }
    }
}
