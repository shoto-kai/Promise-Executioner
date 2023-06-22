import Entity
import Repository
import ServiceProtocol

public struct FindTaskService<T: Repository.TaskFindable>: ServiceProtocol.TaskFindable {

    var finder: T

    public init(_ finder: T) {
        self.finder = finder
    }

    public func find(_ id: AppTask.ID) async throws -> AppTask? {
        try await finder.find(id)
    }
}
