import Foundation

public struct AppTask: Hashable, Codable {

    public typealias ID = Identifier<Self>
    
    public var id: ID
    
    public var title: String
    
    public var note: String
    
    public var state: State
    
    public var conditions: Conditions
    
    public var penalties: Penalties
    
    public init(
        id: ID,
        title: String,
        note: String,
        state: State,
        conditions: Conditions,
        penalties: Penalties
    ) {
        self.id = id
        self.title = title
        self.note = note
        self.state = state
        self.conditions = conditions
        self.penalties = penalties
    }
}
