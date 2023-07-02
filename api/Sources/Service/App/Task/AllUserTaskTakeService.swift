import Entity
import Repository
import ServiceProtocol

public struct AllUserTaskService<T: Repository.AllUserTaskTakeable>: ServiceProtocol
        .AllUserTaskTakeable
{

    var allTaskTaker: T

    public init(allTaskTakeable: T) {
        self.allTaskTaker = allTaskTakeable
    }

    public func takeAll(of: User.ID) async throws -> [AppPromise] {
        try await allTaskTaker.takeAll(of: of)
    }
}
