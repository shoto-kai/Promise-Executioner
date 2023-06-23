import Entity
import Fluent
import Repository

extension AppTaskRepository: AllTaskTakeable {
    public func takeAll() async throws -> [Entity.AppTask] {
        try await Persistence.AppTask.query(on: db)
            .with(\.$sendUserMessagePenalties)
            .with(\.$pushRestriction)
            .all()
            .map({ try $0.toEntity })
    }
}
