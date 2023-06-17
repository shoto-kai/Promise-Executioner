public struct Penalties: Hashable, Codable {

    public var sendMessageToUser: [SendMessageToUserPenalty]

    public init(sendMessageToUser: [SendMessageToUserPenalty]) {
        self.sendMessageToUser = sendMessageToUser
    }
}
