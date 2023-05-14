import Entity

public protocol AllPairNotificationTakeable {
    func takeAll(of: User.ID) async throws -> [PairNotification]
}

public protocol PairNotificationCreatable {
    func create(_ notification: PairNotification) async throws
}
