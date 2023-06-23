import Entity
import Repository
import ServiceProtocol

public struct DeleteTaskService<T: Repository.TaskDeletable>: ServiceProtocol.TaskDeletable {

    var deletor: T

    public init(_ deletor: T) {
        self.deletor = deletor
    }

    public func delete(_ id: AppTask.ID) async throws {
        try await deletor.delete(id)
    }
}
