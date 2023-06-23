import Entity
import Fluent
import Repository

extension AppTaskRepository: TaskFindable {
    public func find(_ id: Entity.AppTask.ID) async throws -> Entity.AppTask? {
        try await Persistence.AppTask.query(on: db)
            .filter(\.$id == id.value)
            .with(\.$sendUserMessagePenalties)
            .with(\.$pushRestriction)
            .first()
            .map({ try $0.toEntity })
    }
}
