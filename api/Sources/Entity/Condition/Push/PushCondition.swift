import Foundation

public struct PushCondition: Hashable, Codable, Identifiable {
    
    public typealias ID = Identifier<Self>
    
    public var id: ID
    
    public var restrictions: [Restriction]
    
    public var state: ConditionState
    
    public init(
        id: ID,
        restrictions: [Restriction],
        state: ConditionState
    ) {
        self.id = id
        self.restrictions = restrictions
        self.state = state
    }
}
