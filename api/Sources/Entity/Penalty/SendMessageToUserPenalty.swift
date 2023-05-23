import Foundation

public struct SendMessageToUserPenalty: Hashable, Codable, Identifiable {
    
    public typealias ID = Identifier<Self>
    
    public var id: ID
    
    public var destine: User
    
    public var amount: Int
    
    public var note: String
    
    public var message: String
    
    public var executedAt: Date?
    
    public init(
        id: ID,
        destine: User,
        amount: Int,
        note: String,
        message: String,
        executedAt: Date? = nil
    ) {
        self.id = id
        self.destine = destine
        self.amount = amount
        self.note = note
        self.message = message
        self.executedAt = executedAt
    }
}

extension SendMessageToUserPenalty {
    public var isExecuted: Bool {
        executedAt != nil
    }
}
