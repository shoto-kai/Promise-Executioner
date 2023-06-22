import Entity
import ServiceProtocol
import Repository

public struct UpdateTaskService<T: Repository.TaskUpdatable>: ServiceProtocol.TaskUpdatable {
    
    var updator: T
    
    public init(_ updator: T) {
        self.updator = updator
    }

    public func update(task: AppTask) async throws {
        try await self.updator.update(task)
    }
}
