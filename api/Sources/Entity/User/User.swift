import Foundation

public struct User: Hashable, Codable, Identifiable {
    
    public typealias ID = Identifier<User>
    
    public var id: ID
    
    public var name: String
    
    public init(id: ID, name: String) {
        self.id = id
        self.name = name
    }
}

extension User: Comparable {
    public static func < (lhs: User, rhs: User) -> Bool {
        lhs.name < rhs.name
    }
}
