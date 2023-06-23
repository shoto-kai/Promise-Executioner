import Foundation

public struct AppTask: Hashable, Codable {

    public typealias ID = Identifier<Self>

    public var id: ID

    public var title: String

    public var note: String

    public var state: State

    public var restriction: Restriction

    public var penalties: [Penalty]

    public init(
        id: ID,
        title: String,
        note: String,
        state: State,
        restriction: Restriction,
        penalties: [Penalty]
    ) {
        self.id = id
        self.title = title
        self.note = note
        self.state = state
        self.restriction = restriction
        self.penalties = penalties
    }
}
