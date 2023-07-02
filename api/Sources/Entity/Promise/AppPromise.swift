import Foundation

public struct AppPromise: Hashable, Codable {

    public typealias ID = Identifier<Self>

    public var id: ID

    public var title: String

    public var note: String

    public var state: State

    public var task: Task

    public var penalties: [Penalty]

    public init(
        id: ID,
        title: String,
        note: String,
        state: State,
        task: Task,
        penalties: [Penalty]
    ) {
        self.id = id
        self.title = title
        self.note = note
        self.state = state
        self.task = task
        self.penalties = penalties
    }
}
