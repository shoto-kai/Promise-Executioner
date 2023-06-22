import Entity
import Repository
import ServiceProtocol

public struct CreateTaskService<T: Repository.TaskCreatable>: ServiceProtocol.TaskCreatable {

    var creator: T

    public init(_ creator: T) {
        self.creator = creator
    }

    public func create(task: AppTask, of: User.ID) async throws {
        try await creator.create(task, of: of)
    }
}
