import Foundation

public struct User: Hashable, Codable, Identifiable {

    public typealias ID = Identifier<User>

    public var id: ID

    public var name: Name

    public var displayName: String

    public init(id: ID, name: Name, displayName: String) {
        self.id = id
        self.name = name
        self.displayName = displayName
    }
}

extension User: Comparable {
    public static func < (lhs: User, rhs: User) -> Bool {
        lhs.name < rhs.name
    }
}
