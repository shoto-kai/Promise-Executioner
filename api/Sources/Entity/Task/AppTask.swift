import Foundation

public struct AppTask: Hashable, Codable {

    public typealias ID = Identifier<AppTask>
    
    public var id: ID
    
    public var title: String
    
    public var note: String
    
    public var restrictions: Restrictions
    
    public var penalties: Penalties
    
    public init(id: ID, title: String, note: String, restrictions: Restrictions, penalties: Penalties) {
        self.id = id
        self.title = title
        self.note = note
        self.restrictions = restrictions
        self.penalties = penalties
    }
}
