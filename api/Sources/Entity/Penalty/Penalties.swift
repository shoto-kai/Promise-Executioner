public struct Penalties: Hashable, Codable {
    
    public var sendUserPenalties: [SendUserPenalty]
    
    public init(sendUserPenalties: [SendUserPenalty]) {
        self.sendUserPenalties = sendUserPenalties
    }
}
