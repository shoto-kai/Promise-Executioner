import Entity
import Repository
import ServiceProtocol

public struct UpdateTaskService<T: Repository.TaskUpdatable>: ServiceProtocol.TaskUpdatable {

    var updator: T

    public init(_ updator: T) {
        self.updator = updator
    }

    public func update(task: AppPromise) async throws {
        try await self.updator.update(task)
    }
}
