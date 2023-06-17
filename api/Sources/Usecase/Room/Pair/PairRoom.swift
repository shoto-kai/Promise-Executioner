import Entity

public struct PairRoom: Hashable, Codable, Identifiable {

    public var id: ID

    public var members: [User]

    public var notifications: [PairNotification]

    public init(
        id: ID,
        members: [User],
        notifications: [PairNotification]
    ) throws {
        self.id = id
        self.members = members
        self.notifications = notifications
    }
}
