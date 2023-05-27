import Foundation

/// 押下条件
public struct PushCondition: Hashable, Codable, Identifiable {
    
    public typealias ID = Identifier<Self>
    
    public var id: ID
    
    public var state: ConditionState
    
    public var deadlineRestriction: DeadlineRestriction?
    
    public init(
        id: ID,
        state: ConditionState,
        deadlineRestriction: DeadlineRestriction? = nil
    ) {
        self.id = id
        self.state = state
        self.deadlineRestriction = deadlineRestriction
    }
}
